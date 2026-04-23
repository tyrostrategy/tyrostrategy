-- ============================================================================
-- Migration 018: viewOnlyOwn bayrağını SELECT seviyesinde enforce et
-- ============================================================================
-- Amaç:
--   role_permissions.permissions->>'viewOnlyOwn' = true olan rollerde (Proje
--   Lideri / Kullanıcı tipik) kullanıcı sadece kendi projesi / katılımcısı
--   olduğu projeleri ve ilgili verileri FETCH edebilsin. Böylece:
--
--     (a) Egress: 224 proje fetch yerine 5-10 proje → ~%90 azalma
--     (b) Güvenlik: client DevTools ile bypass edilemeyen row-level gizlilik
--     (c) Dinamik: Admin Güvenlik sayfasından viewOnlyOwn toggle'ını
--         değiştirdiği anda sonraki query yeni kurala uyar
--
--   viewOnlyOwn=false olan rollerde (Admin / Management) tüm veri erişilebilir.
--
-- Önceki durum:
--   SELECT policy'leri USING (true) — herkes tüm DB'yi okuyordu. Filter sadece
--   usePermissions hook'unda client-side yapılıyordu (cosmetic, güvensiz).
--
-- Kararlar (user onayıyla 2026-04-24):
--   • Aksiyon owner'ı dikkate alınmıyor → aksiyon erişimi = projeye erişim.
--     "Liderin ve üyelerin hepsi projedeki tüm aksiyonları görür."
--   • users: viewOnlyOwn=true + proje.create=true → hepsini gör (formdaki
--     katılımcı dropdown'u için). viewOnlyOwn=true + proje.create=false →
--     sadece kendi projelerindeki kullanıcılar.
--   • tag_definitions: aynı mantık (create varsa tüm library, yoksa sadece
--     kullanılanlar).
--
-- Roadmap notu:
--   X-User-Email header hala spoofable — RLS bunu çözmüyor, sadece
--   role_permissions sınırını enforce ediyor. JWT-based auth migration'ı
--   ayrı bir iş (Supabase Edge Function + MSAL bridge).
-- ============================================================================

-- ─── 0. app.flag DÜZELT — hardcoded tablo oku, rol_permissions canlı değil ─
-- Migration 011 (editOnlyOwn tightening) sırasında app.flag hardcoded CASE
-- WHEN mantığına çevrilmiş: Proje Lideri için viewOnlyOwn hep false döndürmüş.
-- Güvenlik sayfasındaki toggle artık etkisiz. Bunu migration 006 orijinal
-- mantığına geri döndürüyoruz — role_permissions tablosundan canlı oku.
CREATE OR REPLACE FUNCTION app.flag(key text) RETURNS boolean AS $$
DECLARE
  v_role text := app.current_role();
  v_val text;
BEGIN
  IF v_role IS NULL THEN
    RETURN false;
  END IF;
  SELECT rp.permissions ->> key INTO v_val
  FROM public.role_permissions rp
  WHERE rp.role = v_role;
  RETURN COALESCE(v_val::boolean, false);
END;
$$ LANGUAGE plpgsql STABLE SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION app.flag(text) TO anon, authenticated;

-- ─── 1. Helper functions — DRY + RLS recursion ve timeout önleme ─────────
-- SECURITY DEFINER sayesinde fonksiyon içindeki projeler SELECT'i RLS'i
-- bypass eder (tam görünür), sonuç policy evaluation'ında filter olarak
-- kullanılır. Böylece policy'ler arası recursion ve subquery timeout'u
-- yaşanmaz.

-- visible_proje_ids: bu kullanıcının görebildiği projelerin ID kümesi.
-- Her policy bu tek kaynağı kullansın — tekrar tekrar hesaplama yok.
CREATE OR REPLACE FUNCTION app.visible_proje_ids() RETURNS SETOF text AS $$
  SELECT id FROM public.projeler
  WHERE NOT app.flag('viewOnlyOwn')
     OR app.is_owner(owner)
     OR app.is_participant(id);
$$ LANGUAGE sql STABLE SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION app.visible_proje_ids() TO anon, authenticated;

-- can_see_proje: tek proje_id için kısayol (aksiyonlar/participants/tags için).
CREATE OR REPLACE FUNCTION app.can_see_proje(p_proje_id text) RETURNS boolean AS $$
  SELECT p_proje_id IN (SELECT app.visible_proje_ids());
$$ LANGUAGE sql STABLE SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION app.can_see_proje(text) TO anon, authenticated;

-- visible_user_emails: görünür projelerde rol alan kullanıcıların email set'i
-- (owner display_name -> email match + participant email). users policy için.
CREATE OR REPLACE FUNCTION app.visible_user_emails() RETURNS SETOF text AS $$
  SELECT DISTINCT lower(u.email)
  FROM public.users u
  WHERE EXISTS (
    SELECT 1 FROM public.projeler p
    WHERE p.id IN (SELECT app.visible_proje_ids())
      AND (lower(p.owner) = lower(u.display_name) OR lower(p.owner) = lower(u.email))
  )
  UNION
  SELECT DISTINCT lower(pp.user_email)
  FROM public.proje_participants pp
  WHERE pp.proje_id IN (SELECT app.visible_proje_ids());
$$ LANGUAGE sql STABLE SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION app.visible_user_emails() TO anon, authenticated;

-- visible_tag_ids: görünür projelerde kullanılan tag definition ID'leri.
CREATE OR REPLACE FUNCTION app.visible_tag_ids() RETURNS SETOF uuid AS $$
  SELECT DISTINCT pt.tag_id
  FROM public.proje_tags pt
  WHERE pt.proje_id IN (SELECT app.visible_proje_ids());
$$ LANGUAGE sql STABLE SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION app.visible_tag_ids() TO anon, authenticated;

-- ─── 2. Performans — RLS subquery'lerinde kullanılan kolonlara index ──────
-- Küçük tablolarda fark minimal ama büyüdükçe kritik. Olanları IF NOT EXISTS
-- ile güvenli ekliyoruz.
CREATE INDEX IF NOT EXISTS idx_projeler_owner_lower
  ON public.projeler (lower(owner));

CREATE INDEX IF NOT EXISTS idx_proje_participants_email_lower
  ON public.proje_participants (lower(user_email));

CREATE INDEX IF NOT EXISTS idx_proje_tags_tag_id
  ON public.proje_tags (tag_id);

CREATE INDEX IF NOT EXISTS idx_proje_tags_proje_id
  ON public.proje_tags (proje_id);

-- ─── 3. SELECT policy'leri — eski USING (true)'ları güncelle ──────────────

-- NOT: Tüm policy'lerde `app.current_role() IS NOT NULL` şart —  bilinmeyen
-- email'li (system'de kayıt olmayan) istekler hiçbir şey görmesin. Önce
-- bu check false dönerse AND kısa devre yapar, hiç satır dönmez.

-- ── projeler ──
DROP POLICY IF EXISTS "projeler_select" ON public.projeler;
CREATE POLICY "projeler_select" ON public.projeler FOR SELECT
  USING (
    app.current_role() IS NOT NULL
    AND (
      NOT app.flag('viewOnlyOwn')       -- Admin/Management
      OR app.is_owner(owner)             -- Proje Lideri (kendi projesi)
      OR app.is_participant(id)          -- Proje Üyesi
    )
  );

-- ── aksiyonlar ── (aksiyon.owner kullanılmıyor; parent proje erişimine bağlı)
DROP POLICY IF EXISTS "aksiyonlar_select" ON public.aksiyonlar;
CREATE POLICY "aksiyonlar_select" ON public.aksiyonlar FOR SELECT
  USING (
    app.current_role() IS NOT NULL
    AND proje_id IN (SELECT app.visible_proje_ids())
  );

-- ── proje_participants ── (görünür projelerin katılımcıları)
DROP POLICY IF EXISTS "participants_select" ON public.proje_participants;
CREATE POLICY "participants_select" ON public.proje_participants FOR SELECT
  USING (
    app.current_role() IS NOT NULL
    AND proje_id IN (SELECT app.visible_proje_ids())
  );

-- ── proje_tags ── (görünür projelerin tag atamaları)
DROP POLICY IF EXISTS "proje_tags_select" ON public.proje_tags;
CREATE POLICY "proje_tags_select" ON public.proje_tags FOR SELECT
  USING (
    app.current_role() IS NOT NULL
    AND proje_id IN (SELECT app.visible_proje_ids())
  );

-- ── users ──
-- Kendisi + görünür projelerin owner'ı + görünür projelerin katılımcıları.
-- proje.create yetkisi varsa (form dropdown için) hepsini gör.
DROP POLICY IF EXISTS "users_select" ON public.users;
CREATE POLICY "users_select" ON public.users FOR SELECT
  USING (
    app.current_role() IS NOT NULL
    AND (
      NOT app.flag('viewOnlyOwn')                      -- Admin/Management
      OR app.has_perm('proje.create')                   -- form dropdown için hepsi
      OR lower(email) = lower(app.current_email())      -- kendisi
      OR lower(email) IN (SELECT app.visible_user_emails())
    )
  );

-- ── tag_definitions ──
-- proje.create yetkisi varsa tüm tag library (yeni proje tag seçimi için).
-- Yoksa sadece görünür projelerde kullanılan tag'ler.
DROP POLICY IF EXISTS "tags_select" ON public.tag_definitions;
CREATE POLICY "tags_select" ON public.tag_definitions FOR SELECT
  USING (
    app.current_role() IS NOT NULL
    AND (
      NOT app.flag('viewOnlyOwn')
      OR app.has_perm('proje.create')
      OR id IN (SELECT app.visible_tag_ids())
    )
  );

-- ============================================================================
-- 4. Sağlık testleri — migration sonunda otomatik doğrulama
-- ============================================================================
DO $$
DECLARE
  v_admin_email   text := 'cenk.sayli@tiryaki.com.tr';
  v_leader_email  text := 'recep.mergen@tiryaki.com.tr';
  v_proje_count   int;
  v_aksiyon_count int;
  v_user_count    int;
  v_tag_count     int;
BEGIN
  RAISE NOTICE '';
  RAISE NOTICE '═══ Migration 018 Sağlık Testleri ═══';

  -- Test 1: Admin (viewOnlyOwn=false) → tüm satırlar
  PERFORM public.set_user_context(v_admin_email);
  SELECT count(*) INTO v_proje_count   FROM public.projeler;
  SELECT count(*) INTO v_aksiyon_count FROM public.aksiyonlar;
  SELECT count(*) INTO v_user_count    FROM public.users;
  SELECT count(*) INTO v_tag_count     FROM public.tag_definitions;
  RAISE NOTICE '  Admin (cenk): projeler=%, aksiyonlar=%, users=%, tags=%',
    v_proje_count, v_aksiyon_count, v_user_count, v_tag_count;

  -- Test 2: Proje Lideri (viewOnlyOwn=true) → sadece kendi projeleri
  PERFORM public.set_user_context(v_leader_email);
  SELECT count(*) INTO v_proje_count   FROM public.projeler;
  SELECT count(*) INTO v_aksiyon_count FROM public.aksiyonlar;
  SELECT count(*) INTO v_user_count    FROM public.users;
  SELECT count(*) INTO v_tag_count     FROM public.tag_definitions;
  RAISE NOTICE '  Proje Lideri (recep): projeler=%, aksiyonlar=%, users=%, tags=%',
    v_proje_count, v_aksiyon_count, v_user_count, v_tag_count;
  RAISE NOTICE '  (Admin rakamlarından daha az olmalı — filter çalışıyor)';

  -- Test 3: Bilinmeyen email (sistemde yok) → hiçbir şey görmemeli
  PERFORM public.set_user_context('hacker@example.com');
  SELECT count(*) INTO v_proje_count FROM public.projeler;
  RAISE NOTICE '  Unknown email: projeler=% (viewOnlyOwn=true default → 0 beklenen)', v_proje_count;

  -- Reset
  PERFORM public.set_user_context('');

  RAISE NOTICE '═══ Testler tamamlandı ═══';
  RAISE NOTICE '';
END $$;

-- ============================================================================
-- ROLLBACK (sorun olursa):
--
--   DROP POLICY IF EXISTS "projeler_select" ON public.projeler;
--   DROP POLICY IF EXISTS "aksiyonlar_select" ON public.aksiyonlar;
--   DROP POLICY IF EXISTS "participants_select" ON public.proje_participants;
--   DROP POLICY IF EXISTS "proje_tags_select" ON public.proje_tags;
--   DROP POLICY IF EXISTS "users_select" ON public.users;
--   DROP POLICY IF EXISTS "tags_select" ON public.tag_definitions;
--
--   CREATE POLICY "projeler_select"      ON public.projeler            FOR SELECT USING (true);
--   CREATE POLICY "aksiyonlar_select"    ON public.aksiyonlar          FOR SELECT USING (true);
--   CREATE POLICY "participants_select"  ON public.proje_participants  FOR SELECT USING (true);
--   CREATE POLICY "proje_tags_select"    ON public.proje_tags          FOR SELECT USING (true);
--   CREATE POLICY "users_select"         ON public.users               FOR SELECT USING (true);
--   CREATE POLICY "tags_select"          ON public.tag_definitions     FOR SELECT USING (true);
--
--   DROP FUNCTION IF EXISTS app.can_see_proje(text);
-- ============================================================================
