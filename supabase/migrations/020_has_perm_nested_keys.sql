-- ============================================================================
-- Migration 020: app.has_perm — nested key (pages.*) desteği
-- ============================================================================
-- Bug:
--   Migration 016'da users tablosu UPDATE policy'si app.has_perm('pages.kullanicilar')
--   kontrol ediyor. Ama migration 007'deki has_perm yalnızca düz (flat) key'leri
--   biliyor: 'proje.create' → 'canCreateProje', 'aksiyon.edit' → 'canEditAksiyon',
--   ... 'pages.kullanicilar' BU MAPPING'DE YOK.
--
--   ELSE branch'i fallback olarak path'i flat key gibi kabul ediyordu:
--     SELECT permissions ->> 'pages.kullanicilar' ...
--   Ama JSONB'de gerçek yapı NESTED:
--     permissions = { "pages": { "kullanicilar": true, "anasayfa": true, ... } }
--   '->>' direkt key arar, "pages.kullanicilar" diye bir key olmadığı için
--   her zaman NULL → false. Sonuç: Admin bile başka kullanıcının rolünü
--   değiştirmeye çalıştığında WITH CHECK reddediyor →
--   "new row violates row-level security policy" → "Veri senkronizasyonu başarısız".
--
-- Fix:
--   has_perm'i dotted path'i nested traversal yapacak şekilde güncelle.
--   - 'foo.bar' → permissions->'foo'->>'bar'
--   - Tek parçalı path → permissions->>'flat_key' (eski davranış)
--   - Eski legacy flat-key mapping (canCreateProje vs.) korundu, bozulmasın.
-- ============================================================================

CREATE OR REPLACE FUNCTION app.has_perm(path text) RETURNS boolean AS $$
DECLARE
  v_role  text := app.current_role();
  v_key   text;
  v_val   text;
  v_parts text[];
BEGIN
  IF v_role IS NULL THEN
    RETURN false;
  END IF;

  -- 1) Eski legacy flat-key mapping (geriye uyumluluk)
  v_key := CASE path
    WHEN 'proje.create'    THEN 'canCreateProje'
    WHEN 'proje.edit'      THEN 'canEditProje'
    WHEN 'proje.delete'    THEN 'canDeleteProje'
    WHEN 'aksiyon.create'  THEN 'canCreateAksiyon'
    WHEN 'aksiyon.edit'    THEN 'canEditAksiyon'
    WHEN 'aksiyon.delete'  THEN 'canDeleteAksiyon'
    WHEN 'users.manage'    THEN 'canManageUsers'
    WHEN 'settings.manage' THEN 'canManageSettings'
    WHEN 'view.all'        THEN 'canViewAll'
    ELSE NULL
  END;

  IF v_key IS NOT NULL THEN
    SELECT rp.permissions ->> v_key INTO v_val
    FROM public.role_permissions rp
    WHERE rp.role = v_role;
    RETURN COALESCE(v_val::boolean, false);
  END IF;

  -- 2) Dotted path → nested traversal (pages.kullanicilar gibi)
  v_parts := string_to_array(path, '.');
  IF array_length(v_parts, 1) = 2 THEN
    SELECT rp.permissions -> v_parts[1] ->> v_parts[2] INTO v_val
    FROM public.role_permissions rp
    WHERE rp.role = v_role;
    RETURN COALESCE(v_val::boolean, false);
  END IF;

  -- 3) Tek parçalı path → doğrudan flat key
  SELECT rp.permissions ->> path INTO v_val
  FROM public.role_permissions rp
  WHERE rp.role = v_role;
  RETURN COALESCE(v_val::boolean, false);
END;
$$ LANGUAGE plpgsql STABLE SECURITY DEFINER;

-- ============================================================================
-- Doğrulama (SQL Editor'da çalıştır):
--
--   -- Admin için pages.kullanicilar true dönmeli:
--   SELECT app.current_email() AS me;  -- session'da boş olabilir, normal
--
--   -- Set test header context (PostgREST'siz manual test için):
--   SET LOCAL "request.headers" = '{"x-user-email":"cenk.sayli@tiryaki.com.tr"}';
--   SELECT app.current_role()              AS my_role;            -- 'Admin' beklenir
--   SELECT app.has_perm('pages.kullanicilar') AS users_perm;       -- TRUE beklenir (önceden FALSE)
--   SELECT app.has_perm('pages.guvenlik')     AS security_perm;    -- Admin için TRUE
--   SELECT app.has_perm('proje.create')       AS legacy_perm;      -- TRUE (legacy mapping korundu)
--
--   -- Proje Lideri için pages.kullanicilar false dönmeli:
--   SET LOCAL "request.headers" = '{"x-user-email":"<bir-proje-lideri>@tiryaki.com.tr"}';
--   SELECT app.has_perm('pages.kullanicilar') AS users_perm;       -- FALSE beklenir
--
-- Bu doğrulama geçerse uygulamada:
--   1) Admin → users sayfasından role değiştirme: "Veri senkronizasyonu başarısız"
--      yerine sessizce başarılı olmalı.
--   2) Proje Lideri / Kullanıcı: kendi locale dışında bir alanı değiştiremeyecek
--      (016 self-locale-only kuralı korunur).
-- ============================================================================

-- ============================================================================
-- ROLLBACK (sorun olursa migration 007'deki haline geri dön):
--
--   CREATE OR REPLACE FUNCTION app.has_perm(path text) RETURNS boolean AS $$
--   DECLARE
--     v_role text := app.current_role();
--     v_key  text;
--     v_val  text;
--   BEGIN
--     IF v_role IS NULL THEN RETURN false; END IF;
--     v_key := CASE path
--       WHEN 'proje.create'    THEN 'canCreateProje'
--       WHEN 'proje.edit'      THEN 'canEditProje'
--       WHEN 'proje.delete'    THEN 'canDeleteProje'
--       WHEN 'aksiyon.create'  THEN 'canCreateAksiyon'
--       WHEN 'aksiyon.edit'    THEN 'canEditAksiyon'
--       WHEN 'aksiyon.delete'  THEN 'canDeleteAksiyon'
--       WHEN 'users.manage'    THEN 'canManageUsers'
--       WHEN 'settings.manage' THEN 'canManageSettings'
--       WHEN 'view.all'        THEN 'canViewAll'
--       ELSE path
--     END;
--     SELECT rp.permissions ->> v_key INTO v_val
--     FROM public.role_permissions rp WHERE rp.role = v_role;
--     RETURN COALESCE(v_val::boolean, false);
--   END;
--   $$ LANGUAGE plpgsql STABLE SECURITY DEFINER;
-- ============================================================================
