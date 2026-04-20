-- ============================================================================
-- Migration 011: editOnlyOwn artık katı sahiplik kontrolü
-- ============================================================================
-- Kural: "Kim neyi düzenleyebilir yetkiden gelecek her zaman."
--
--   * Üyelik projeye DAHİL olmayı sağlar (görme, KPI'da sayılma)
--   * Ama edit yetkisi role + katı sahiplik ikilisine bağlıdır
--   * editOnlyOwn=true → sadece owner olduğum satır düzenlenebilir
--   * editOnlyOwn=false → ilgili role perm'i varsa herhangi biri düzenlenebilir
--   * Üyelik + editOnlyOwn=true kombinasyonu → düzenleme yok (kapalı)
--
-- Migration 006'da bu, is_participant() ve is_owner(parent.owner) dalları
-- nedeniyle gevşekti. Şimdi katılaştırıyoruz — frontend usePermissions
-- kuralı ile simetri: her iki katmanda "yetkiden gelir, sahiplik strict".
-- ============================================================================

DROP POLICY IF EXISTS "projeler_update" ON public.projeler;
CREATE POLICY "projeler_update" ON public.projeler FOR UPDATE
  USING (
    app.has_perm('proje.edit')
    AND (
      NOT app.flag('editOnlyOwn')
      OR app.is_owner(owner)
    )
  );

DROP POLICY IF EXISTS "aksiyonlar_update" ON public.aksiyonlar;
CREATE POLICY "aksiyonlar_update" ON public.aksiyonlar FOR UPDATE
  USING (
    app.has_perm('aksiyon.edit')
    AND (
      NOT app.flag('editOnlyOwn')
      OR app.is_owner(owner)
    )
  );

-- DELETE policy'leri değişmez — role'un delete perm'i varsa deletenecek.
-- editOnlyOwn delete'e uygulanmıyor (frontend usePermissions ile simetrik).
-- ============================================================================
