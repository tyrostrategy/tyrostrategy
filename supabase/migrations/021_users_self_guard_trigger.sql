-- ============================================================================
-- Migration 021: users UPDATE recursion fix — policy → trigger
-- ============================================================================
-- Bug:
--   Migration 016'daki users UPDATE policy WITH CHECK içinde subquery:
--     SELECT u.email FROM public.users u WHERE lower(u.email) = lower(app.current_email())
--   Bu subquery users tablosunu sorguluyor → users SELECT policy tetikleniyor
--   → policy app.current_role() çağırıyor → o da `SELECT FROM users` yapıyor
--   → SONSUZ DÖNGÜ. PostgreSQL "42P17 infinite recursion detected" döner,
--   PostgREST'e 500 dönüyor → adapter throw → "Veri senkronizasyonu başarısız".
--
-- Çözüm:
--   WITH CHECK'i sadeleştir (TRUE), self-only-locale kuralını BEFORE UPDATE
--   trigger'a taşı. Trigger SECURITY DEFINER + NEW vs OLD direkt karşılaştırma
--   yapar, RLS bypass'lı, recursion yok. Aynı güvenlik garantisi, sıfır
--   recursion.
--
-- Korunan davranış:
--   * pages.kullanicilar yetkisi olan: tüm kolonları güncelleyebilir
--   * Yetkisi olmayan, kendi satırı: SADECE locale değişebilir, diğer
--     kolonlar değişirse RAISE EXCEPTION
--   * Yetkisi olmayan, başkasının satırı: USING reddeder (zaten 0 satır)
-- ============================================================================

-- ─── 1. Trigger function: SECURITY DEFINER, NEW vs OLD doğrulama ──────────
CREATE OR REPLACE FUNCTION app.guard_user_self_locale_only()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, app
AS $$
BEGIN
  -- 1) Yetkili admin: tüm değişikliklere izin
  IF app.has_perm('pages.kullanicilar') THEN
    RETURN NEW;
  END IF;

  -- 2) Self değilse zaten USING ile reject olmalı; defansif kontrol
  IF lower(NEW.email) <> lower(COALESCE(app.current_email(), '')) THEN
    RAISE EXCEPTION 'Bu kullanıcı satırını güncelleme yetkin yok'
      USING ERRCODE = '42501';
  END IF;

  -- 3) Self update — sadece locale değişebilir, diğer kolonlar değişmemeli
  IF (NEW.email        IS DISTINCT FROM OLD.email)
     OR (NEW.role         IS DISTINCT FROM OLD.role)
     OR (NEW.department   IS DISTINCT FROM OLD.department)
     OR (NEW.display_name IS DISTINCT FROM OLD.display_name)
     OR (NEW.title        IS DISTINCT FROM OLD.title)
     OR (NEW.is_active    IS DISTINCT FROM OLD.is_active)
  THEN
    RAISE EXCEPTION 'Bu kullanıcı için sadece dil tercihi değiştirilebilir'
      USING ERRCODE = '42501';
  END IF;

  RETURN NEW;
END;
$$;

-- ─── 2. Trigger'ı bağla (BEFORE UPDATE) ───────────────────────────────────
DROP TRIGGER IF EXISTS trg_users_self_guard ON public.users;
CREATE TRIGGER trg_users_self_guard
  BEFORE UPDATE ON public.users
  FOR EACH ROW
  EXECUTE FUNCTION app.guard_user_self_locale_only();

-- ─── 3. Policy'i sadeleştir — recursion'u kapatır ──────────────────────────
DROP POLICY IF EXISTS "users_update" ON public.users;
CREATE POLICY "users_update" ON public.users FOR UPDATE
  USING (
    app.has_perm('pages.kullanicilar')
    OR lower(email) = lower(app.current_email())
  )
  WITH CHECK (true);  -- trigger karar veriyor; subquery yok → recursion yok

-- ============================================================================
-- Doğrulama (PostgREST üzerinden, manuel):
--
--   1) Admin başkasının rolünü değiştirebilir:
--      curl -X PATCH 'https://<proj>/rest/v1/users?id=eq.<bsk>' \
--           -H 'apikey: ...' -H 'X-User-Email: cenk.sayli@tiryaki.com.tr' \
--           -d '{"role":"Proje Lideri"}'
--      → 200 + güncellenen satır (önceden 500 + recursion error)
--
--   2) Proje Lideri / Kullanıcı kendi rolünü Admin yapamaz:
--      curl -X PATCH 'https://<proj>/rest/v1/users?id=eq.<self>' \
--           -H 'apikey: ...' -H 'X-User-Email: <self>@...' \
--           -d '{"role":"Admin"}'
--      → 4xx + "sadece dil tercihi değiştirilebilir"
--
--   3) Self locale update hâlâ çalışıyor:
--      curl -X PATCH ... -d '{"locale":"en"}' → 200 OK
-- ============================================================================
