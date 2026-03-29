-- ================================================================
-- Migration 002: locale column + RLS fix for mock auth
-- ================================================================

-- 1. Add locale column to users (default 'tr')
ALTER TABLE public.users
  ADD COLUMN IF NOT EXISTS locale TEXT DEFAULT 'tr';

-- 2. Fix Cenk's department (was 'Genel' in live DB, should be 'IT')
UPDATE public.users
  SET department = 'IT'
  WHERE email = 'cenk.sayli@tiryaki.com.tr';

-- 3. Fix RLS on users table:
--    Old policy required app.user_email session variable (not set in mock auth).
--    New policy: allow all operations via anon key (this is an internal SaaS,
--    auth is handled at the app layer via MSAL/mock, not Supabase Auth).
DROP POLICY IF EXISTS "users_all" ON public.users;
CREATE POLICY "users_insert" ON public.users FOR INSERT WITH CHECK (true);
CREATE POLICY "users_update" ON public.users FOR UPDATE USING (true);
CREATE POLICY "users_delete" ON public.users FOR DELETE USING (true);

-- 4. Fix RLS on tag_definitions (same issue)
DROP POLICY IF EXISTS "tags_all" ON public.tag_definitions;
CREATE POLICY "tags_insert" ON public.tag_definitions FOR INSERT WITH CHECK (true);
CREATE POLICY "tags_update" ON public.tag_definitions FOR UPDATE USING (true);
CREATE POLICY "tags_delete" ON public.tag_definitions FOR DELETE USING (true);
