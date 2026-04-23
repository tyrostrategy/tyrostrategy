-- ============================================================================
-- Migration 019: "Kullanıcı" rolünü sistemden kaldır
-- ============================================================================
-- Kararı veren: user (2026-04-24). Sebep: rol çok dar kapsamlıydı (yalnızca
-- atanan aksiyonları görüyordu) ve pratik olarak hiçbir çalışana atanmamış.
-- Proje Lideri rolü onun yerine geçiyor — viewOnlyOwn flag'ıyla aynı davranış.
--
-- Pre-check: DELETE öncesi users tablosunda role='Kullanıcı' satır var mı?
-- 2026-04-24 itibarıyla 0 kişi (tüm 44 kullanıcı Admin/Management/Proje Lideri).
-- Bu yüzden destructive değil.
-- ============================================================================

-- 1. role_permissions'tan sil
DELETE FROM public.role_permissions WHERE role = 'Kullanıcı';

-- 2. CHECK constraint — app artık Kullanıcı ekleyemesin (belirli rol seti)
ALTER TABLE public.role_permissions
  DROP CONSTRAINT IF EXISTS role_permissions_role_check;
ALTER TABLE public.role_permissions
  ADD CONSTRAINT role_permissions_role_check
  CHECK (role IN ('Admin', 'Proje Lideri', 'Management'));

-- users tablosuna da aynı CHECK — sonraki insert/update'lerde typo yakalar
ALTER TABLE public.users
  DROP CONSTRAINT IF EXISTS users_role_check;
ALTER TABLE public.users
  ADD CONSTRAINT users_role_check
  CHECK (role IN ('Admin', 'Proje Lideri', 'Management'));

-- 3. Sağlık testi — sonrası gerçekten temiz mi?
DO $$
DECLARE
  v_rp_count int;
  v_u_count int;
BEGIN
  SELECT COUNT(*) INTO v_rp_count FROM public.role_permissions WHERE role = 'Kullanıcı';
  SELECT COUNT(*) INTO v_u_count  FROM public.users            WHERE role = 'Kullanıcı';
  IF v_rp_count > 0 OR v_u_count > 0 THEN
    RAISE EXCEPTION 'Migration 019 FAILED — Kullanıcı rol kayıtları hala var: rp=%, users=%', v_rp_count, v_u_count;
  END IF;
  RAISE NOTICE '✓ Migration 019 — Kullanıcı rolü temiz. role_permissions + users check constraint aktif.';
END $$;

-- ============================================================================
-- ROLLBACK:
--   ALTER TABLE public.role_permissions DROP CONSTRAINT role_permissions_role_check;
--   ALTER TABLE public.users DROP CONSTRAINT users_role_check;
--   INSERT INTO public.role_permissions (role, permissions) VALUES
--     ('Kullanıcı', '{...default perms...}'::jsonb);
-- ============================================================================
