-- Supabase Seed Data - Generated from Cascade Excel Şubat 2026
-- Run in Supabase SQL Editor

-- 1. USERS
INSERT INTO users (azure_oid, email, display_name, department, role) VALUES
  ('oid-001', 'ozan.yesilyer@tiryaki.com.tr', 'Ozan Yeşilyer', 'Tarım', 'Proje Lideri'),
  ('oid-002', 'recep.mergen@tiryaki.com.tr', 'Recep Mergen', 'Tarım', 'Proje Lideri'),
  ('oid-003', 'taylan.eiilmez@tiryaki.com.tr', 'Taylan Eğilmez', 'Ticaret', 'Proje Lideri'),
  ('oid-004', 'idris.ilhan.telci@tiryaki.com.tr', 'İdris İlhan Telci', 'Denizcilik', 'Proje Lideri'),
  ('oid-005', 'guven.emrah.erenler@tiryaki.com.tr', 'Güven Emrah Erenler', 'İnsan Kaynakları', 'Proje Lideri'),
  ('oid-006', 'suat.sobucovali@tiryaki.com.tr', 'Suat Söbüçovalı', 'Ar-Ge', 'Proje Lideri'),
  ('oid-007', 'kerime.ikizler@tiryaki.com.tr', 'Kerime İkizler', 'Bilgi Teknolojileri', 'Proje Lideri'),
  ('oid-008', 'murat.solak@tiryaki.com.tr', 'Murat Solak', 'Üretim', 'Proje Lideri'),
  ('oid-009', 'nazli.deniz.cetin@tiryaki.com.tr', 'Nazlı Deniz Çetin', 'Risk Yönetimi', 'Proje Lideri'),
  ('oid-010', 'arzu.orsel@tiryaki.com.tr', 'Arzu Örsel', 'Kurumsal İletişim', 'Proje Lideri'),
  ('oid-011', 'yiiit.karaci@tiryaki.com.tr', 'Yiğit Karacı', 'Uluslararası Operasyonlar', 'Proje Lideri'),
  ('oid-012', 'emre.padar@tiryaki.com.tr', 'Emre Padar', 'Üretim', 'Proje Lideri'),
  ('oid-013', 'burcu.gozen@tiryaki.com.tr', 'Burcu Gözen', 'Finans', 'Proje Lideri'),
  ('oid-014', 'kubra.dombek@tiryaki.com.tr', 'Kübra Dömbek', 'Kalite', 'Proje Lideri'),
  ('oid-015', 'devrim.askin@tiryaki.com.tr', 'Devrim Aşkın', 'Finans', 'Proje Lideri'),
  ('oid-016', 'ahmet.kalkan./.halil.ibrahim.ozturk@tiryaki.com.tr', 'Ahmet Kalkan / Halil İbrahim Öztürk', 'İş Güvenliği', 'Proje Lideri'),
  ('oid-017', 'tarkan.ferhat.yilmaz@tiryaki.com.tr', 'Tarkan Ferhat Yılmaz', 'İnsan Kaynakları', 'Proje Lideri'),
  ('oid-018', 'raif.karaci@tiryaki.com.tr', 'Raif Karacı', 'Uluslararası Operasyonlar', 'Proje Lideri'),
  ('oid-019', 'tamer.latifoilu@tiryaki.com.tr', 'Tamer Latifoğlu', 'Dış Ticaret', 'Proje Lideri'),
  ('oid-020', 'kemal.yildiz@tiryaki.com.tr', 'Kemal Yıldız', 'Uluslararası Operasyonlar', 'Proje Lideri'),
  ('oid-021', 'nevzat.cakmak@tiryaki.com.tr', 'Nevzat Çakmak', 'Uluslararası Operasyonlar', 'Proje Lideri'),
  ('oid-022', 'fatih.tiryakioilu@tiryaki.com.tr', 'Fatih Tiryakioğlu', 'Yönetim', 'Proje Lideri'),
  ('oid-023', 'bahadir.acik@tiryaki.com.tr', 'Bahadır Açık', 'Uluslararası Operasyonlar', 'Proje Lideri'),
  ('oid-024', 'cenk.sayli@tiryaki.com.tr', 'Cenk Şayli', 'Genel', 'Admin')
ON CONFLICT (azure_oid) DO NOTHING;

-- 2. TAG DEFINITIONS
INSERT INTO tag_definitions (id, name, color) VALUES
  (gen_random_uuid(), 'Ön Çalışma', '#D4A017'),
  (gen_random_uuid(), 'Geliştirme', '#3b82f6'),
  (gen_random_uuid(), 'Uygulama', '#10b981')
ON CONFLICT (name) DO NOTHING;

-- 3. PROJELER (50)
INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P22-0001', 'TR Antep Fıstığı ile Çin pazarına giriş', 'Antep fıstığı ürünlerinin Çin pazarına girişi için pazar araştırması ve dağıtım ağının kurulması.', 'Türkiye', 'On Track', 0, 'Tarım', '2022-11-01', '2025-01-01', '2024-12-01',
    id FROM users WHERE azure_oid = 'oid-001'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0002', 'Muş Sulama Sistemi', 'Modern sulama altyapısı ile tarımsal verimliliğin artırılması ve su kaynaklarının etkin yönetimi.', 'Türkiye', 'On Track', 0, 'Tarım', '2025-01-01', '2025-05-25', '2025-04-25',
    id FROM users WHERE azure_oid = 'oid-002'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0003', 'Muş Tarımsal Mekanizasyon Projesi', 'Tarımsal mekanizasyon kapasitesinin güçlendirilmesi ve modern ekipman temini.', 'Türkiye', 'On Track', 0, 'Tarım', '2025-05-01', '2026-07-01', '2026-06-01',
    id FROM users WHERE azure_oid = 'oid-002'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P23-0005', 'Faz 1 - Değişkenli Tarım (2024-2025 Sezonu)', 'Türkiye stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Türkiye', 'On Track', 0, 'Tarım', '2023-10-21', '2026-12-01', '2026-11-01',
    id FROM users WHERE azure_oid = 'oid-002'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0006', 'Faz 2 - Rejeneratif Tarım (2025-2026 Sezonu)', 'Türkiye stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Türkiye', 'At Risk', 0, 'Tarım', '2024-10-01', '2026-12-31', '2026-12-01',
    id FROM users WHERE azure_oid = 'oid-002'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0007', 'Yem katkı ihracat satışlarının arttırılması', 'Türkiye stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Türkiye', 'On Track', 0, 'Ticaret', '2024-07-01', '2026-06-30', '2026-05-30',
    id FROM users WHERE azure_oid = 'oid-003'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0008', 'Yıldız Alparslan Anıtkır Yatırımında Arsa Edinimi', 'Türkiye stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Türkiye', 'On Track', 0, 'Tarım', '2025-03-01', '2027-12-01', '2027-11-01',
    id FROM users WHERE azure_oid = 'oid-002'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0009', '2 adet 8330 dwt''lik Deniz-Nehir tipi gemi inşa projesi', 'Deniz-Nehir tipi gemi inşa projesi kapsamında tersane seçimi ve inşaat sürecinin takibi.', 'Kurumsal', 'On Track', 0, 'Denizcilik', '2024-01-01', '2026-03-31', '2026-03-03',
    id FROM users WHERE azure_oid = 'oid-004'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0010', 'Bireysel Performans Yönetim Sistemi''nin kurulması', 'Bireysel performans yönetim sisteminin tasarlanması ve devreye alınması.', 'Kurumsal', 'On Track', 0, 'İnsan Kaynakları', '2024-08-05', '2025-11-30', '2025-10-30',
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0011', 'Buğday Derin İşleme', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Ar-Ge', '2024-06-01', '2027-07-31', '2027-07-01',
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P26-0012', 'Çiftlik Yönetimi FarmERP', 'Çiftlik yönetim sistemi FarmERP entegrasyonunun tamamlanması.', 'Kurumsal', 'At Risk', 0, 'Bilgi Teknolojileri', '2026-02-02', '2026-12-31', '2026-12-01',
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0013', 'Giresun protein tesisi 2. kısım kapasite arttırım projesi', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Üretim', '2024-05-01', '2026-05-31', '2026-05-01',
    id FROM users WHERE azure_oid = 'oid-008'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0014', 'Tiryaki Sigorta Strateji & Prosedürlerinin Belirlenmesi ve Yürürlüğe Konması', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Risk Yönetimi', '2025-01-01', '2027-09-30', '2027-08-30',
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0015', 'Grup Şirketleri Genelinde Sigorta Süreçlerinin ERP Sistemine Uyarlanması', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Risk Yönetimi', '2024-08-01', '2027-07-31', '2027-07-01',
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0016', 'MKT Süreçlerinin Uygun Bir Şekilde Yönetimi', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Risk Yönetimi', '2024-08-15', '2026-06-01', '2026-05-01',
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0017', 'HR&ADC Entegrasyon Projesi', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Bilgi Teknolojileri', '2024-08-18', '2025-08-31', '2025-07-31',
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0018', 'Integrity Project', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Ar-Ge', '2024-02-04', '2027-12-12', '2027-11-12',
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0019', 'İntranet Kurulumu - Tedarikçi belirlenmesi ve satınalma süreci', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Kurumsal İletişim', '2025-05-11', '2025-12-30', '2025-11-30',
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0020', 'ITSM Projesi', 'BT servis yönetimi platformunun kurulması ve süreç otomasyonu.', 'Kurumsal', 'On Track', 0, 'Bilgi Teknolojileri', '2025-06-02', '2026-03-31', '2026-03-03',
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0021', 'Kazakistan Buğday Tesisi kurulumu', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Uluslararası Operasyonlar', '2024-04-01', '2027-06-30', '2027-05-30',
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0022', 'Mamul Depo Konveyör Hattının Uzatılması projesi', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Üretim', '2024-08-09', '2025-10-31', '2025-10-01',
    id FROM users WHERE azure_oid = 'oid-012'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0023', 'Faz1 - NOLA İskele ve Depo Yenileme, Raylı Sistem Entegrasyonu', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Uluslararası Operasyonlar', '2025-01-01', '2026-06-15', '2026-05-15',
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P27-0024', 'Faz2 - Deodorizasyon Ünitesinin Rafineriye Dön. & Yenilenebilir Yağ Tankları', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'Not Started', 0, 'Uluslararası Operasyonlar', '2027-06-01', '2027-06-01', '2027-05-01',
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0025', 'Operasyonel KPK belirleme ve BI rapor çalışması', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Finans', '2025-01-01', '2026-01-01', '2025-12-01',
    id FROM users WHERE azure_oid = 'oid-013'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0026', 'Organik İzlenebilirlik Dijitalleştirme', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'At Risk', 0, 'Kalite', '2024-07-01', '2026-03-31', '2026-03-03',
    id FROM users WHERE azure_oid = 'oid-014'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0027', 'Pillar-2 Modeli (Yerel ve Küresel Asgari Kurumlar Vergisi müessesi)', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Finans', '2024-08-01', '2026-12-31', '2026-12-01',
    id FROM users WHERE azure_oid = 'oid-015'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0028', 'Riziko Teftiş Çalışması', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Risk Yönetimi', '2025-01-01', '2027-07-01', '2027-06-01',
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0029', 'Sharepoint Migration', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Bilgi Teknolojileri', '2024-06-24', '2025-12-31', '2025-12-01',
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0030', 'Sıfır İş Kazası Projesi', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'İş Güvenliği', '2024-01-01', '2026-12-31', '2026-12-01',
    id FROM users WHERE azure_oid = 'oid-016'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0031', 'Sunrise Apollo Projesi', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'At Risk', 0, 'Bilgi Teknolojileri', '2025-09-15', '2026-05-01', '2026-04-01',
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0032', 'Sürdürülebilirlik Raporu', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Kurumsal İletişim', '2024-07-02', '2026-03-06', '2026-02-06',
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0033', 'Takdir ve ödüllendirme sisteminin kurulması', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'İnsan Kaynakları', '2024-06-11', '2026-06-30', '2026-05-30',
    id FROM users WHERE azure_oid = 'oid-017'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0034', 'Tiryaki Agro Global İnovasyon Merkezi (TAGIC)', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Ar-Ge', '2024-10-01', '2028-12-31', '2028-12-01',
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0035', 'Tiryaki Dijital Akademi', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'İnsan Kaynakları', '2024-04-01', '2025-12-31', '2025-12-01',
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0036', 'Tiryaki LTIP programının global düzeyde hayata geçirilmesi', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'Achieved', 0, 'İnsan Kaynakları', '2024-04-01', '2025-11-20', '2025-10-20',
    id FROM users WHERE azure_oid = 'oid-017'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0037', 'Tiryaki Yapay Zeka Projesi (TYRO HR & TRADER Agent)', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Bilgi Teknolojileri', '2025-10-01', '2026-03-31', '2026-03-03',
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0038', 'Ukrayna orijinli organik ürünlerin üretilmesi ve tedarik edilmesi', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Uluslararası Operasyonlar', '2024-10-01', '2025-12-31', '2025-12-01',
    id FROM users WHERE azure_oid = 'oid-018'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0039', 'Uluslararası Çalışma Modelleri, Prosedür ve Sözleşmeleri', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'İnsan Kaynakları', '2024-04-01', '2026-03-31', '2026-03-03',
    id FROM users WHERE azure_oid = 'oid-017'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0040', 'Faz 1: Tiryaki Agro web sitesinin güncellenmesi, Tiryaki Yem, Tiryaki Lidaş (19 adet site)', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Kurumsal İletişim', '2025-04-16', '2025-10-31', '2025-10-01',
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0041', 'Faz 2: Tiryaki Irak, Afrika, Denizcilik ve diğer sitelerinin oluşturulması', 'Deniz-Nehir tipi gemi inşa projesi kapsamında tersane seçimi ve inşaat sürecinin takibi.', 'Kurumsal', 'On Track', 0, 'Kurumsal İletişim', '2025-09-10', '2026-04-24', '2026-03-24',
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P26-0042', 'Faz 3: Giresunport sitesinin taşınması, Yıldız sitesinin Tiryaki Tohum ve Tiryaki''ye dönüştürülmesi', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Kurumsal İletişim', '2026-01-05', '2026-05-15', '2026-04-15',
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0043', 'Yetkilendirilmiş Yükümlü Sistemi Kurulumu Projesi', 'Kurumsal stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'Kurumsal', 'On Track', 0, 'Dış Ticaret', '2024-07-01', '2025-11-30', '2025-10-30',
    id FROM users WHERE azure_oid = 'oid-019'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P22-0044', 'Carbon Trading', 'Karbon ticareti projesi kapsamında pilot saha hazırlığı ve sertifikasyon.', 'International', 'On Track', 0, 'Uluslararası Operasyonlar', '2022-10-15', '2026-12-31', '2026-12-01',
    id FROM users WHERE azure_oid = 'oid-020'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P14-0045', 'Djibouti Port Investment', 'International stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'International', 'On Track', 0, 'Uluslararası Operasyonlar', '2014-04-01', '2027-12-31', '2027-12-01',
    id FROM users WHERE azure_oid = 'oid-021'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P23-0046', 'Grand Al Faw Port Project', 'International stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'International', 'On Track', 0, 'Yönetim', '2023-07-01', '2025-12-31', '2025-12-01',
    id FROM users WHERE azure_oid = 'oid-022'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0047', 'Investment in Sugar Refinery Plant in Venezuela', 'International stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'International', 'At Risk', 0, 'Uluslararası Operasyonlar', '2025-01-01', '2026-12-31', '2026-12-01',
    id FROM users WHERE azure_oid = 'oid-021'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P26-0048', 'Iraq Agro Holding', 'Irak Agro Holding yapılanması ve tarımsal operasyonların konsolidasyonu.', 'International', 'On Track', 0, 'Uluslararası Operasyonlar', '2026-01-01', '2027-12-31', '2027-12-01',
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P24-0049', 'Organisational Alignment and Training Programme in Iraq', 'International stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'International', 'At Risk', 0, 'İnsan Kaynakları', '2024-05-31', '2026-06-30', '2026-05-30',
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P26-0050', 'Review of African country structures', 'International stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'International', 'On Track', 0, 'İnsan Kaynakları', '2026-03-01', '2028-06-30', '2028-05-30',
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)
  SELECT 'P25-0051', 'Venezuela Coal Facility Project', 'International stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.', 'International', 'At Risk', 0, 'Uluslararası Operasyonlar', '2025-07-01', '2028-12-31', '2028-12-01',
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

-- 4. AKSIYONLAR (296)
INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A22-0001', 'P22-0001', '1-Pazar analizi', 'Veri toplama, analiz ve değerlendirme çalışmaları.', 100, 'Achieved', '2022-11-01', '2023-05-30', 1,
    id FROM users WHERE azure_oid = 'oid-001', '2023-05-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A23-0002', 'P22-0001', '2-Rakip analizi', 'Veri toplama, analiz ve değerlendirme çalışmaları.', 100, 'Achieved', '2023-01-01', '2023-01-01', 2,
    id FROM users WHERE azure_oid = 'oid-001', '2023-01-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0003', 'P22-0001', '3-Teşvik sistemlerinin incelenmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2024-01-01', '2024-03-31', 3,
    id FROM users WHERE azure_oid = 'oid-001', '2024-03-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0004', 'P22-0001', '4-Bölge şube kuruluşu', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2024-02-01', '2024-08-31', 4,
    id FROM users WHERE azure_oid = 'oid-001', '2024-08-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A23-0005', 'P22-0001', '5-Satış kanallarının oluşturulması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2023-01-01', '2025-01-01', 5,
    id FROM users WHERE azure_oid = 'oid-001', '2025-01-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0006', 'P22-0001', '6-Stratejik stok bulundurma', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 50, 'At Risk', '2024-08-01', '2025-01-01', 6,
    id FROM users WHERE azure_oid = 'oid-001'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A21-0007', 'P25-0002', '7-B2-B3-B7 Proje İnşaat İşleri', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2021-04-01', '2021-06-30', 1,
    id FROM users WHERE azure_oid = 'oid-002', '2021-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A20-0008', 'P25-0002', '3-B2-B3-B7 Proje Su İhtiyaç Analizi', 'Veri toplama, analiz ve değerlendirme çalışmaları.', 100, 'Achieved', '2020-06-01', '2020-06-30', 2,
    id FROM users WHERE azure_oid = 'oid-002', '2020-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A20-0009', 'P25-0002', '2-B2-B3-B7 Proje Fizibilite Çalışması', 'Fizibilite çalışmasının hazırlanması ve karar raporunun sunulması.', 100, 'Achieved', '2020-06-01', '2020-06-30', 3,
    id FROM users WHERE azure_oid = 'oid-002', '2020-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A20-0010', 'P25-0002', '3-B2-B3-B7 Proje Çizimleri ve Mühendislik Çalışmaları', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2020-06-01', '2020-06-30', 4,
    id FROM users WHERE azure_oid = 'oid-002', '2020-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0011', 'P25-0002', '4-B2-B3-B7 Taşeron Seçimi ve Anlaşması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-01-01', '2026-12-31', 5,
    id FROM users WHERE azure_oid = 'oid-002', '2026-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A20-0012', 'P25-0002', '6-B2-B3-B7 Proje Kazı Çalışmaları', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2020-09-01', '2021-04-30', 6,
    id FROM users WHERE azure_oid = 'oid-002', '2021-04-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A20-0013', 'P25-0002', '6-B2-B3-B7 Tarla İçi Dağıtım Hattı Yeraltı Sulama Borusu Kurulumu', 'Sistem kurulumu ve canlıya alma sürecinin yönetimi.', 100, 'Achieved', '2020-09-01', '2021-05-31', 7,
    id FROM users WHERE azure_oid = 'oid-002', '2021-05-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A21-0014', 'P25-0002', '9-B1-B5 Sulama İhtiyaç Analizi', 'Veri toplama, analiz ve değerlendirme çalışmaları.', 100, 'Achieved', '2021-04-01', '2021-04-30', 8,
    id FROM users WHERE azure_oid = 'oid-002', '2021-04-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A21-0015', 'P25-0002', '11-B1-B5 Proje Fizibilite Çalışması', 'Fizibilite çalışmasının hazırlanması ve karar raporunun sunulması.', 100, 'Achieved', '2021-04-01', '2026-12-31', 9,
    id FROM users WHERE azure_oid = 'oid-002', '2026-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A21-0016', 'P25-0002', '10-B2-B3-B7 Dağıtım Hattı Test Edilmesi', 'Pilot ortamda test edilmesi ve geri bildirim toplanması.', 100, 'Achieved', '2021-05-01', '2026-12-31', 10,
    id FROM users WHERE azure_oid = 'oid-002', '2026-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A21-0017', 'P25-0002', '11-B1-B5 Proje Fizibilite Çalışması', 'Fizibilite çalışmasının hazırlanması ve karar raporunun sunulması.', 100, 'Achieved', '2021-05-01', '2026-12-31', 11,
    id FROM users WHERE azure_oid = 'oid-002', '2026-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A21-0018', 'P25-0002', '12-B1-B5 Proje Çizimleri ve Mühendislik Çalışmaları', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2021-05-01', '2026-12-31', 12,
    id FROM users WHERE azure_oid = 'oid-002', '2026-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A21-0019', 'P25-0002', '13-B1-B5 Taşeron Seçimi ve Anlaşması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2021-09-01', '2021-10-01', 13,
    id FROM users WHERE azure_oid = 'oid-002', '2021-10-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A21-0020', 'P25-0002', '14-B1-B5 Proje Kazı Çalışmaları', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2021-09-01', '2021-12-31', 14,
    id FROM users WHERE azure_oid = 'oid-002', '2021-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A21-0021', 'P25-0002', '15-B1-B5 Tarla İçi Dağıtım Hattı Yeraltı Sulama Kurulumu ve Montaj', 'Sistem kurulumu ve canlıya alma sürecinin yönetimi.', 100, 'Achieved', '2021-11-01', '2021-12-31', 15,
    id FROM users WHERE azure_oid = 'oid-002', '2021-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A22-0022', 'P25-0002', '17-B1-B5 Ana Filtrasyon Kurulumu', 'Sistem kurulumu ve canlıya alma sürecinin yönetimi.', 100, 'Achieved', '2022-05-01', '2022-05-31', 16,
    id FROM users WHERE azure_oid = 'oid-002', '2022-05-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A22-0023', 'P25-0002', '18-B1-B5 Murat Nehri İsale Hattı Boru Kurulumu ve Montajı', 'Sistem kurulumu ve canlıya alma sürecinin yönetimi.', 100, 'Achieved', '2022-05-01', '2022-05-31', 17,
    id FROM users WHERE azure_oid = 'oid-002', '2022-05-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A22-0024', 'P25-0002', '18-B2-B3-B7 Sisteme Su Verilmesi ve Sulama Yapılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2022-05-01', '2022-06-30', 18,
    id FROM users WHERE azure_oid = 'oid-002', '2022-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A23-0025', 'P25-0002', '19-B2-B3-B7 Sisteme Su Verilmesi ve Sulama Yapılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 50, 'At Risk', '2023-12-01', '2026-01-01', 19,
    id FROM users WHERE azure_oid = 'oid-002'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A23-0026', 'P25-0002', '20-B1-B5 Murat Nehri İsale Hattı Test Edilmesi', 'Pilot ortamda test edilmesi ve geri bildirim toplanması.', 100, 'Achieved', '2023-12-01', '2026-01-01', 20,
    id FROM users WHERE azure_oid = 'oid-002', '2026-01-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0027', 'P25-0002', '21-B1-B5 Murat Nehri Su Sağlama Noktası Otomasyonu', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2024-05-01', '2024-06-30', 21,
    id FROM users WHERE azure_oid = 'oid-002', '2024-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0028', 'P25-0002', '22-B1-B5 Dağıtım Hattı Testi', 'Pilot ortamda test edilmesi ve geri bildirim toplanması.', 100, 'Achieved', '2025-01-01', '2026-01-01', 22,
    id FROM users WHERE azure_oid = 'oid-002', '2026-01-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0029', 'P25-0002', '23-B1-B5 Sisteme Su Verilmesi ve Sulama Yapılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-01-01', '2025-11-01', 23,
    id FROM users WHERE azure_oid = 'oid-002', '2025-11-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0030', 'P25-0003', '1 adet 9 m iş genişliğinde Hububat mibzeri', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-01-01', '2026-07-01', 1,
    id FROM users WHERE azure_oid = 'oid-002', '2026-07-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0031', 'P25-0003', '2 adet 9 m Azaltılmış toprak İşleme Ekipmanı', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-01-01', '2026-07-01', 2,
    id FROM users WHERE azure_oid = 'oid-002', '2026-07-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0032', 'P25-0003', '2 adet 9 m iş genişliğinde sıraya ekim mibzeri', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-01-01', '2026-07-01', 3,
    id FROM users WHERE azure_oid = 'oid-002', '2026-07-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0033', 'P25-0003', '2 adet 450 HP traktör', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-01-01', '2026-07-01', 4,
    id FROM users WHERE azure_oid = 'oid-002', '2026-07-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A23-0034', 'P23-0005', '1- Örtü Bitkilerinin Ekilmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2023-10-21', '2026-12-01', 1,
    id FROM users WHERE azure_oid = 'oid-002', '2026-12-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A23-0035', 'P23-0005', '2- Düşük Dozlarda Gübre Uygulamaları', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2023-10-21', '2026-12-01', 2,
    id FROM users WHERE azure_oid = 'oid-002', '2026-12-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A23-0036', 'P23-0005', '3- Rejeneratif Tarıma Uygun Ekipman Alımı', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2023-10-21', '2026-10-31', 3,
    id FROM users WHERE azure_oid = 'oid-002', '2026-10-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A23-0037', 'P23-0005', '4- Yeni Alınan Ekipmanlara Uygun Toprak İşlemelerinin Yapılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2023-10-21', '2026-10-31', 4,
    id FROM users WHERE azure_oid = 'oid-002', '2026-10-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0038', 'P24-0006', '1- Örtü bitkisi ve etkileri', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2024-04-04', '2025-10-31', 1,
    id FROM users WHERE azure_oid = 'oid-002', '2025-10-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0039', 'P24-0006', '2- Striptill uygulaması ve sonuçları', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 50, 'At Risk', '2024-10-01', '2026-12-31', 2,
    id FROM users WHERE azure_oid = 'oid-002'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0040', 'P24-0006', '3- Subsoiler uygulaması ve sonuçları', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 50, 'At Risk', '2024-10-01', '2026-12-31', 3,
    id FROM users WHERE azure_oid = 'oid-002'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0041', 'P24-0007', '1-Kıbrıs pazarında amino asit satışlarının arttırılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2024-07-01', '2026-06-30', 1,
    id FROM users WHERE azure_oid = 'oid-003', '2026-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0042', 'P24-0007', '2-Azerbaycan pazarında premix ve amino asit satışlarını arttırarak devamı', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2024-07-01', '2026-06-30', 2,
    id FROM users WHERE azure_oid = 'oid-003', '2026-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0043', 'P24-0007', '3-USA aminoasit için Eppen veya Dongxiao görüşmeler, Sunrise işbirliği', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2024-07-01', '2026-06-30', 3,
    id FROM users WHERE azure_oid = 'oid-003', '2026-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0044', 'P24-0007', '4-Suriye''ye Çin''den aminoasit, Triden aminoasit ve premix satışlarının başlaması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 50, 'At Risk', '2024-07-01', '2026-06-30', 4,
    id FROM users WHERE azure_oid = 'oid-003'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0045', 'P24-0007', '5-Suriye''ye 1 Kişinin alınması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 50, 'At Risk', '2025-09-01', '2026-06-30', 5,
    id FROM users WHERE azure_oid = 'oid-003'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0046', 'P24-0007', '6-Suriye''ye satışların artırılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 50, 'At Risk', '2025-09-01', '2026-06-30', 6,
    id FROM users WHERE azure_oid = 'oid-003'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0047', 'P24-0007', '7-Irak''a Türkiye ve Çin''den aminoasit satışlarının başlaması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2024-07-01', '2026-06-30', 7,
    id FROM users WHERE azure_oid = 'oid-003', '2026-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0048', 'P24-0007', '8-Irak''a 1 kişinin alınması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-09-01', '2026-06-30', 8,
    id FROM users WHERE azure_oid = 'oid-003', '2026-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0049', 'P25-0008', '1-Mevcut Alanımızı Arttırmak', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-03-01', '2027-12-01', 1,
    id FROM users WHERE azure_oid = 'oid-002', '2027-12-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0050', 'P25-0008', '2-Verimli ve sulanabilir arazilerin satınalınması / uzun dönem kiralanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 50, 'On Track', '2025-03-01', '2027-12-31', 2,
    id FROM users WHERE azure_oid = 'oid-002'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0051', 'P24-0009', '1-Fizibilite', 'Fizibilite çalışmasının hazırlanması ve karar raporunun sunulması.', 0, 'Achieved', '2024-01-01', '2024-05-28', 1,
    id FROM users WHERE azure_oid = 'oid-004', '2024-05-28'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0052', 'P24-0009', '2-İnşa yapacak tersanenin ve gemi tipinin belirlenmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-01-01', '2024-05-28', 2,
    id FROM users WHERE azure_oid = 'oid-004', '2024-05-28'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0053', 'P24-0009', '3-Tersane ve Leasing anlaşmalarının yapılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-01-01', '2024-05-28', 3,
    id FROM users WHERE azure_oid = 'oid-004', '2024-05-28'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0054', 'P24-0009', '4-Gemi inşası', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2024-11-01', '2026-03-31', 4,
    id FROM users WHERE azure_oid = 'oid-004'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0055', 'P24-0010', '1-Proje ekibinin kurulması, kapsam ve hedefin net tanımlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-08-05', '2024-08-14', 1,
    id FROM users WHERE azure_oid = 'oid-005', '2024-08-14'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0056', 'P24-0010', '2-Piyasa en iyi uygulamalarının araştırması ve analizi', 'Veri toplama, analiz ve değerlendirme çalışmaları.', 0, 'Achieved', '2024-08-15', '2024-09-16', 2,
    id FROM users WHERE azure_oid = 'oid-005', '2024-09-16'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0057', 'P24-0010', '3-Tiryaki performans sistemi önerilerinin geliştirilmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-09-16', '2024-10-31', 3,
    id FROM users WHERE azure_oid = 'oid-005', '2024-10-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0058', 'P24-0010', '4-Üst yönetim sunum ve onay aşaması', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'On Track', '2025-05-01', '2025-05-30', 4,
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0059', 'P24-0010', '5-Prosedürlerin hazırlanması, iletişim, performans formlarının oluşturulması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-06-02', '2025-11-30', 5,
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0060', 'P24-0011', '1-Land Allocation', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-12-10', '2025-06-15', 1,
    id FROM users WHERE azure_oid = 'oid-006', '2025-06-15'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0061', 'P24-0011', '2-Business Plan', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-06-10', '2025-06-15', 2,
    id FROM users WHERE azure_oid = 'oid-006', '2025-06-15'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0062', 'P24-0011', '3-Design Engineering', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-11-01', '2025-05-10', 3,
    id FROM users WHERE azure_oid = 'oid-006', '2025-05-10'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0063', 'P24-0011', '4-Selection of Technology and Management Suppliers', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'At Risk', '2024-06-01', '2026-12-31', 4,
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A27-0064', 'P24-0011', '5-Commissioning', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2027-03-01', '2027-07-31', 5,
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0065', 'P26-0012', 'Milestone 0: Discovery & Onsite Understanding', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2026-02-02', '2026-12-31', 1,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0066', 'P26-0012', 'Milestone 1: Kick-Off Meeting', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2026-03-01', '2026-03-02', 2,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0067', 'P26-0012', 'Milestone 2: Business Process Walk Through', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-15', '2026-03-31', 3,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0068', 'P26-0012', 'Milestone 3: System Configuration', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-22', '2026-04-05', 4,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0069', 'P26-0012', 'Milestone 4: Master Data Migration', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-04-12', '2026-04-26', 5,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0070', 'P26-0012', 'Milestone 5: End User Training', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-04-27', '2026-05-10', 6,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0071', 'P26-0012', 'Milestone 6: UAT/Trail Runs', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-05-10', '2026-05-24', 7,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0072', 'P26-0012', 'Milestone 7: Go-Live Data Migration', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-05-24', '2026-06-07', 8,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0073', 'P26-0012', 'Milestone 8: Go-Live', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-06-01', '2026-06-07', 9,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0074', 'P24-0013', '1-Giresun Ayçekirdeği tesis kapasitesinin arttırılması için araştırmalar yapılması', 'Veri toplama, analiz ve değerlendirme çalışmaları.', 0, 'Achieved', '2024-05-01', '2024-06-13', 1,
    id FROM users WHERE azure_oid = 'oid-008', '2024-06-13'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0075', 'P24-0013', '2-Proje için gerekli ekipmanların belirlenmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-06-16', '2024-08-11', 2,
    id FROM users WHERE azure_oid = 'oid-008', '2024-08-11'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0076', 'P24-0013', '3-İlgili çözüm yolları ile ilgili tedarikçi görüşmelerinin başlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-08-13', '2024-09-22', 3,
    id FROM users WHERE azure_oid = 'oid-008', '2024-09-22'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0077', 'P24-0013', '4-İlgili verilerin üst yönetime sunulması ve proje bütçesinin onaylanması', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'Achieved', '2024-09-29', '2024-10-27', 4,
    id FROM users WHERE azure_oid = 'oid-008', '2024-10-27'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0078', 'P24-0013', '5-Tedarikçi ile anlaşmanın imzalanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-10-21', '2024-10-31', 5,
    id FROM users WHERE azure_oid = 'oid-008', '2024-10-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0079', 'P24-0013', '6-Ekipmanların satın alma sürecinin tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-02-10', '2025-10-31', 6,
    id FROM users WHERE azure_oid = 'oid-008'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0080', 'P24-0013', '7-Tesisin kurulumu ve devreye alınması', 'Sistem kurulumu ve canlıya alma sürecinin yönetimi.', 0, 'Not Started', '2025-11-01', '2026-05-31', 7,
    id FROM users WHERE azure_oid = 'oid-008'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0081', 'P25-0014', '1-Grup Şirketlerini Kapsar Genel Sigorta Stratejisinin Belirlenmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-01-01', '2026-06-01', 1,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0082', 'P25-0014', '2-Belirlenen Strateji''ye Göre Poliçe/Teminat Bazlı Prosedürlerin Oluşturulması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-01', '2026-12-31', 2,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0083', 'P25-0014', '3-Yazılan Prosedürler için Üst Yönetim Onayının Alınması', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'Not Started', '2026-03-01', '2026-09-30', 3,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0084', 'P25-0014', '4-Prosedürlerin Grup Bünyesindeki Şirketlere Tebliğ Edilip Uygulanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-12-31', '2027-06-01', 4,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A27-0085', 'P25-0014', '5-Süreçler, Satın Alma ve Hasarlar ile İlgili Eğitimlerin Verilmesi', 'Kullanıcı eğitimlerinin planlanması ve gerçekleştirilmesi.', 0, 'Not Started', '2027-03-30', '2027-09-30', 5,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0086', 'P24-0015', '1-Üretim ve Hasar Datalarının ERP Sistemine Yüklenmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2024-08-01', '2025-12-31', 1,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0087', 'P24-0015', '2-ERP Raporlama Düzeninin Belirlenmesi ve Data Girişlerinin Yapılması', 'İlerleme raporlarının hazırlanması ve paydaşlara sunulması.', 0, 'Not Started', '2025-07-31', '2026-07-31', 2,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0088', 'P24-0015', '3-Hasar Süreçlerinde İş Birimi Bilgi ve Belgelerinin ERP Kayıt & Akış Entegrasyonu', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-07-31', '2026-07-31', 3,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0089', 'P24-0015', '4-Satın Alma Süreçlerinde İş Birimi Belgelerinin ERP Kayıt & Akış Entegrasyonu', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-07-31', '2026-07-31', 4,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0090', 'P24-0015', '5-Oluşturulan ERP Sisteminin Tüm Grup Şirketlerine Entegrasyonu', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-07-31', '2027-07-31', 5,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0091', 'P24-0015', '6-Sigorta Yönetimi ERP Modülünün Global Grup Şirketlerine Tanıtım Eğitimi', 'Kullanıcı eğitimlerinin planlanması ve gerçekleştirilmesi.', 0, 'Not Started', '2026-07-31', '2027-07-31', 6,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0092', 'P24-0016', '1-Tesislerin Sigortalanabilir Değerlerinin Tespiti için Saha Ziyaret Planlaması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-08-25', '2024-09-13', 1,
    id FROM users WHERE azure_oid = 'oid-009', '2024-09-13'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0093', 'P24-0016', '2-Tesis Sigortalanabilir Kıymetlerin Değer Kontrol ve Tespiti', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2024-09-13', '2024-10-16', 2,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0094', 'P24-0016', '3-Yatırım Departmanı ile Tesiste Tespit Edilen Bedellerin Kontrol ve Teyidi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-10-15', '2024-11-16', 3,
    id FROM users WHERE azure_oid = 'oid-009', '2024-11-16'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0095', 'P24-0016', '4-Sigortalanabilir Kıymetlerin Grup Şirketler Bazında Ayrıştırılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-09-01', '2024-11-01', 4,
    id FROM users WHERE azure_oid = 'oid-009', '2024-11-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0096', 'P24-0016', '5-Sigortalanabilir Kıymetlerin Düzenli Değerleme & Kontrol Sistemi Oluşturulması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'At Risk', '2025-01-01', '2026-06-01', 5,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0097', 'P24-0017', '1-Planlama', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-08-18', '2024-08-20', 1,
    id FROM users WHERE azure_oid = 'oid-007', '2024-08-20'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0098', 'P24-0017', '2-Hazırlık ve Test Aşaması', 'Pilot ortamda test edilmesi ve geri bildirim toplanması.', 0, 'Achieved', '2024-08-18', '2024-09-24', 2,
    id FROM users WHERE azure_oid = 'oid-007', '2024-09-24'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0099', 'P24-0017', '3-Yeni AD & Tenant Entegrasyonu', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-08-18', '2024-08-20', 3,
    id FROM users WHERE azure_oid = 'oid-007', '2024-08-20'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0100', 'P24-0017', '4-ERP HR & Active Directory Entegrasyonu', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-09-23', '2024-09-30', 4,
    id FROM users WHERE azure_oid = 'oid-007', '2024-09-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0101', 'P24-0017', '5-ERP HR ve Active Directory Entegrasyonunun Test İşlemleri', 'Pilot ortamda test edilmesi ve geri bildirim toplanması.', 0, 'Achieved', '2024-08-26', '2024-10-22', 5,
    id FROM users WHERE azure_oid = 'oid-007', '2024-10-22'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0102', 'P24-0017', '6-Contact Sync Entra ID Kullanıcıları İçin Üyelik Senkronizasyonu', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-08-26', '2024-09-18', 6,
    id FROM users WHERE azure_oid = 'oid-007', '2024-09-18'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0103', 'P24-0017', '7-ERP HR ve Active Directory Entegrasyonunun Devreye Alınması', 'Sistem kurulumu ve canlıya alma sürecinin yönetimi.', 0, 'On Track', '2024-10-14', '2026-02-27', 7,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0104', 'P24-0018', '1-Project Incentive & Corporations', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2024-03-01', '2026-03-01', 1,
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0105', 'P24-0018', '2-Theoretical and Compositional Analysis', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-02-04', '2024-05-31', 2,
    id FROM users WHERE azure_oid = 'oid-006', '2024-05-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0106', 'P24-0018', '3-Scope and Concept', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-04-04', '2025-12-31', 3,
    id FROM users WHERE azure_oid = 'oid-006', '2025-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0107', 'P24-0018', '4-Pilot Scale Testings', 'Pilot ortamda test edilmesi ve geri bildirim toplanması.', 0, 'On Track', '2024-09-01', '2026-09-01', 4,
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0108', 'P24-0018', '5-Business Plan & FM', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-08-01', '2025-12-31', 5,
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0109', 'P24-0018', '6-Selection of Technology and Suppliers', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-08-04', '2026-06-01', 6,
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0110', 'P24-0018', '7-Commissioning', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-31', '2027-12-12', 7,
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0111', 'P25-0019', '1-Bütçe onayı, tedarikçi belirlenmesi, satınalma sürecinin tamamlanması', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'On Track', '2025-05-11', '2025-07-09', 1,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0112', 'P25-0019', '2-Tasarımın tamamlanması, içerik başlıklarının belirlenmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-06-25', '2025-10-24', 2,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0113', 'P25-0019', '3-Türkçe ve İngilizce içeriklerin oluşturulması ve girişlerinin tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-08-22', '2025-12-31', 3,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0114', 'P25-0019', '4-İnsan Kaynakları sistemleri ile entegrasyonun tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-09-18', '2026-05-15', 4,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0115', 'P25-0019', '5-Mavi yakalar ile ilişkin geliştirmelerin tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-09-28', '2026-05-16', 5,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0116', 'P25-0020', '1-Analiz ve Sistem Tasarımı', 'Veri toplama, analiz ve değerlendirme çalışmaları.', 0, 'Achieved', '2025-03-15', '2025-07-31', 1,
    id FROM users WHERE azure_oid = 'oid-007', '2025-07-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0117', 'P25-0020', '2-Xurrent Kurulumunun Tamamlanması', 'Sistem kurulumu ve canlıya alma sürecinin yönetimi.', 0, 'Achieved', '2025-06-15', '2025-06-30', 2,
    id FROM users WHERE azure_oid = 'oid-007', '2025-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0118', 'P25-0020', '3-Sistem Destek', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-07-01', '2025-07-08', 3,
    id FROM users WHERE azure_oid = 'oid-007', '2025-07-08'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0119', 'P25-0020', '4-Canlıya Taşıma', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-08-18', '2025-08-31', 4,
    id FROM users WHERE azure_oid = 'oid-007', '2025-08-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0120', 'P25-0020', '5-Canlı Sonrası Destek', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-09-01', '2025-09-30', 5,
    id FROM users WHERE azure_oid = 'oid-007', '2025-09-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0121', 'P25-0020', '6-Raporlama Çalışmaları', 'İlerleme raporlarının hazırlanması ve paydaşlara sunulması.', 0, 'Achieved', '2025-10-15', '2025-11-30', 6,
    id FROM users WHERE azure_oid = 'oid-007', '2025-11-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0122', 'P25-0020', '7-Hizmet Seviyesi Yönetimi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-10-03', '2025-10-31', 7,
    id FROM users WHERE azure_oid = 'oid-007', '2025-10-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0123', 'P25-0020', '8-Proje Yönetimi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-10-05', '2025-11-30', 8,
    id FROM users WHERE azure_oid = 'oid-007', '2025-11-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0124', 'P25-0020', '9-Değişiklik Yönetimi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2026-01-01', '2026-02-28', 9,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0125', 'P25-0020', '10-BT Varlık Yönetimi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2026-03-02', '2026-04-01', 10,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0126', 'P25-0020', '11-DevOps Entegrasyon', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-11-24', '2026-01-26', 11,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0127', 'P25-0020', '12-Problem Yönetimi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-02-27', '2026-03-31', 12,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0128', 'P25-0020', '13-Yazılım Geliştirme (Scrum Workspace)', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-02-22', '2026-03-31', 13,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0129', 'P24-0021', '1-Business Plan dökümanlarının hazırlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-04-01', '2025-01-16', 1,
    id FROM users WHERE azure_oid = 'oid-011', '2025-01-16'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0130', 'P24-0021', '2-Şirketin kurulması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-04-01', '2024-06-30', 2,
    id FROM users WHERE azure_oid = 'oid-011', '2024-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0131', 'P24-0021', '3-Layout projesinin çizilmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-07-28', '2024-08-04', 3,
    id FROM users WHERE azure_oid = 'oid-011', '2024-08-04'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0132', 'P24-0021', '4-Teknoloji firmasının seçilmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2024-09-02', '2025-08-31', 4,
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0133', 'P24-0021', '5-İnşaat işlerinin tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-09-01', '2027-05-31', 5,
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A27-0134', 'P24-0021', '6-Test ve Devreye Alma', 'Pilot ortamda test edilmesi ve geri bildirim toplanması.', 0, 'Not Started', '2027-06-01', '2027-06-30', 6,
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0135', 'P24-0022', '1-Piyasa araştırılması yapılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-08-09', '2024-09-01', 1,
    id FROM users WHERE azure_oid = 'oid-012', '2024-09-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0136', 'P24-0022', '2-Aksiyon planı oluşturulması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-09-02', '2024-09-15', 2,
    id FROM users WHERE azure_oid = 'oid-012', '2024-09-15'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0137', 'P24-0022', '3-Uygun çözümlerin araştırılması ve en uygun seçeneğin belirlenmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-09-15', '2024-11-12', 3,
    id FROM users WHERE azure_oid = 'oid-012', '2024-11-12'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0138', 'P24-0022', '4-Bütçe planlaması ve kaynaklar tahsisi', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'On Track', '2024-11-15', '2025-05-31', 4,
    id FROM users WHERE azure_oid = 'oid-012'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0139', 'P24-0022', '5-Operasyon süreçlerinde uygulamaya başlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-06-01', '2025-10-31', 5,
    id FROM users WHERE azure_oid = 'oid-012'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0140', 'P25-0023', '1-Son yerleşim düzenine göre makine, ekipman, maliyet çalışması yapılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-07-29', '2024-08-12', 1,
    id FROM users WHERE azure_oid = 'oid-011', '2024-08-12'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0141', 'P25-0023', '2-Amerika''nın yerlisi bir Proje Müdürü''nün bulunması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-07-31', '2025-01-01', 2,
    id FROM users WHERE azure_oid = 'oid-011', '2025-01-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0142', 'P25-0023', '3-Contractor seçiminin yapılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-11-18', '2025-02-02', 3,
    id FROM users WHERE azure_oid = 'oid-011', '2025-02-02'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0143', 'P25-0023', '4-Yenilenme sürecinin tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-07-10', '2025-09-30', 4,
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0144', 'P25-0023', '5-Satınalma işlerinin yapılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-02-13', '2025-07-31', 5,
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0145', 'P25-0023', '6-Test ve devreye alma sürecinin tamamlanması', 'Pilot ortamda test edilmesi ve geri bildirim toplanması.', 0, 'Not Started', '2025-09-01', '2025-09-30', 6,
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0146', 'P27-0024', '1-Layout projesinin çizilmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-07-01', '2025-07-07', 1,
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0147', 'P27-0024', '2-Temel mühendislik tasarımlarının hazırlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-08-07', '2025-11-30', 2,
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0148', 'P27-0024', '3-EPC Yüklenicisinin seçilmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-12-01', '2025-12-31', 3,
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0149', 'P27-0024', '4-Proje İnşaat süreci', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-07-01', '2027-05-31', 4,
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0150', 'P27-0024', '5-Test ve Devreye Alma', 'Pilot ortamda test edilmesi ve geri bildirim toplanması.', 0, 'Not Started', '2026-05-31', '2026-06-30', 5,
    id FROM users WHERE azure_oid = 'oid-011'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0151', 'P25-0025', '1-Üretim KPI, holding genelinde rapor ve ölçümlenen KPI''ların incelenmesi', 'İlerleme raporlarının hazırlanması ve paydaşlara sunulması.', 0, 'Achieved', '2025-01-01', '2025-07-01', 1,
    id FROM users WHERE azure_oid = 'oid-013', '2025-07-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0152', 'P25-0025', '2-Takip edilecek operasyonel KPI listesinin belirlenmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-01-01', '2025-06-30', 2,
    id FROM users WHERE azure_oid = 'oid-013', '2025-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0153', 'P25-0025', '3-Proje ekibinin belirlenmesi, dep. yöneticileri ve finans ekibiyle görüşülmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Behind', '2025-07-01', '2026-03-31', 3,
    id FROM users WHERE azure_oid = 'oid-013'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0154', 'P25-0025', '4-İhtiyaç duyulan data kaynaklarının belirlenmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-06-01', '2025-10-31', 4,
    id FROM users WHERE azure_oid = 'oid-013', '2025-10-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0155', 'P25-0025', '5-KPI''ların Power BI platformuna taşınması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Behind', '2025-09-01', '2026-03-31', 5,
    id FROM users WHERE azure_oid = 'oid-013'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0156', 'P25-0025', '6-BI raporlarının yönetim ve operasyon ekibinin kullanımına sunulması', 'İlerleme raporlarının hazırlanması ve paydaşlara sunulması.', 0, 'Not Started', '2025-07-01', '2026-04-30', 6,
    id FROM users WHERE azure_oid = 'oid-013'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0157', 'P24-0026', '1-RFQ hazırlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-07-01', '2024-07-10', 1,
    id FROM users WHERE azure_oid = 'oid-014', '2024-07-10'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0158', 'P24-0026', '2-Kalite Departmanı Doküman Yönetim Sistemi / İş Akış Süreç Belirleme', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-07-24', '2024-07-31', 2,
    id FROM users WHERE azure_oid = 'oid-014', '2024-07-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0159', 'P24-0026', '3-ERP Tetikleme Noktaları Belirlenmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'At Risk', '2024-11-15', '2025-07-01', 3,
    id FROM users WHERE azure_oid = 'oid-014'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0160', 'P24-0026', '4-Formların Dijitalleştirilmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'At Risk', '2024-12-01', '2025-07-01', 4,
    id FROM users WHERE azure_oid = 'oid-014'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0161', 'P24-0026', '5-Kontrollerin yapılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-05-30', '2025-07-31', 5,
    id FROM users WHERE azure_oid = 'oid-014', '2025-07-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0162', 'P24-0026', '6-El terminallerinin satın alım sürecinin tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Behind', '2025-08-31', '2026-03-31', 6,
    id FROM users WHERE azure_oid = 'oid-014'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0163', 'P24-0026', '7-Depo Temizlik Formu/Hammadde Alım Formu''nun tetiklenmesi ve entegrasyonu', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-08-31', '2025-12-31', 7,
    id FROM users WHERE azure_oid = 'oid-014'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0164', 'P24-0026', '8-Faz 1: Depo Temizlik Formu ve Hammadde Alım Formu''nun demo ortamında çalışması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-08-31', '2026-02-28', 8,
    id FROM users WHERE azure_oid = 'oid-014'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0165', 'P24-0026', '9-Faz 2 olarak kalan diğer formların entegrasyonunun yapılması ve dijitalizasyonu', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-12-31', '2026-03-31', 9,
    id FROM users WHERE azure_oid = 'oid-014'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0166', 'P24-0027', '1-Tiryaki Holding açısından Pillar-2 Modeline ilişkin etki analizi', 'Veri toplama, analiz ve değerlendirme çalışmaları.', 0, 'Achieved', '2024-08-01', '2024-11-15', 1,
    id FROM users WHERE azure_oid = 'oid-015', '2024-11-15'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0167', 'P24-0027', '2-Etki analizi sonucunda tespit edilen bulgular üzerinden bir yol haritası', 'Veri toplama, analiz ve değerlendirme çalışmaları.', 0, 'Achieved', '2024-11-15', '2024-11-30', 2,
    id FROM users WHERE azure_oid = 'oid-015', '2024-11-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0168', 'P24-0027', '3-Grup genelinde reorganizasyon modellerinin çalışılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-12-01', '2025-05-16', 3,
    id FROM users WHERE azure_oid = 'oid-015', '2025-05-16'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0169', 'P24-0027', '4-Uygulanmasına karar verilen modellerin uygulamaya geçirilmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Behind', '2025-05-15', '2026-08-31', 4,
    id FROM users WHERE azure_oid = 'oid-015'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0170', 'P24-0027', '5-Gerekli verilerin toplanması ve gerekli beyanların yapılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'At Risk', '2026-01-01', '2026-12-31', 5,
    id FROM users WHERE azure_oid = 'oid-015'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0171', 'P25-0028', '1-Yurt İçi Tesislerde Risk Müh. ve Tesis Yetkilileri ile Saha Ziyaretleri Planlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-09-30', '2026-05-31', 1,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0172', 'P25-0028', '2-Tavsiyeler ve Alınması Gereken Aksiyonların Tesislerle Koordinasyonu', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-05-31', '2026-06-30', 2,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0173', 'P25-0028', '3-Düzenli Takiplerin Yapılması ve Tesislerde Risk Açığını Sıfırlamak', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-31', '2027-07-01', 3,
    id FROM users WHERE azure_oid = 'oid-009'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0174', 'P24-0029', '1-Kavramsal Tasarım ve Ön Gerekliliklerinin Gerçekleştirilmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-07-01', '2024-07-16', 1,
    id FROM users WHERE azure_oid = 'oid-007', '2024-07-16'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0175', 'P24-0029', '2-Mevcut Durum Analiz ve Geçiş Planlaması', 'Veri toplama, analiz ve değerlendirme çalışmaları.', 0, 'Achieved', '2024-06-24', '2024-08-02', 2,
    id FROM users WHERE azure_oid = 'oid-007', '2024-08-02'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0176', 'P24-0029', '3-Pilot Geçiş & Geçiş Planının Finalize Edilmesi', 'Pilot ortamda test edilmesi ve geri bildirim toplanması.', 0, 'Achieved', '2024-08-10', '2024-10-19', 3,
    id FROM users WHERE azure_oid = 'oid-007', '2024-10-19'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0177', 'P24-0029', '4-Yaygınlaştırma', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2024-11-01', '2026-02-27', 4,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0178', 'P24-0029', '5-Eğitim ve Proje Kapanış', 'Kullanıcı eğitimlerinin planlanması ve gerçekleştirilmesi.', 0, 'Not Started', '2025-05-01', '2025-12-31', 5,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0179', 'P24-0030', '1-İSG''nin idari işlerden ayrılarak ayrı bir departman olarak yapılandırılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-09-02', '2024-09-20', 1,
    id FROM users WHERE azure_oid = 'oid-016', '2024-09-20'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0180', 'P24-0030', '2-İSG departman yöneticisinin iş görüşmeleri ve işe alım sürecinin tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-09-20', '2025-01-01', 2,
    id FROM users WHERE azure_oid = 'oid-016', '2025-01-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0181', 'P24-0030', '3-İSG Yöneticisinin oryantasyonunun tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-02-28', '2025-03-31', 3,
    id FROM users WHERE azure_oid = 'oid-016', '2025-03-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0182', 'P24-0030', '4-Global İSG Organizasyon planının çıkartılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-05-01', '2025-06-01', 4,
    id FROM users WHERE azure_oid = 'oid-016', '2025-06-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0183', 'P24-0030', '5-Global İSG Organizasyon Planının Onaylanması', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'Achieved', '2025-08-01', '2025-09-30', 5,
    id FROM users WHERE azure_oid = 'oid-016', '2025-09-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0184', 'P24-0030', '6-En temel 6 İSG sürecinin global yapı için prosedürleştirilmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-06-30', '2025-12-01', 6,
    id FROM users WHERE azure_oid = 'oid-016', '2025-12-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0185', 'P24-0030', '7-6 Temel İSG Sürecinin İcra''dan başlayarak yönetim ekibiyle paylaşılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'At Risk', '2025-11-02', '2026-06-25', 7,
    id FROM users WHERE azure_oid = 'oid-016'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0186', 'P24-0030', '8-6 Temel İSG sürecinin tesisler ile eğitimlerle paylaşılması', 'Kullanıcı eğitimlerinin planlanması ve gerçekleştirilmesi.', 0, 'Achieved', '2025-11-02', '2025-12-31', 8,
    id FROM users WHERE azure_oid = 'oid-016', '2025-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0187', 'P24-0030', '9-Bütçe doğrultusunda 3 temel risk değerlendirmesinin başlatılması', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'Not Started', '2025-10-26', '2026-05-29', 9,
    id FROM users WHERE azure_oid = 'oid-016'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0188', 'P25-0031', '2-To Be', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2026-01-19', '2026-03-02', 1,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0189', 'P25-0031', '3-IT Gap Analysis', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-16', '2026-05-01', 2,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0190', 'P24-0032', '1-Tiryaki Agro ve Anadolu Holding rapor içerikleriyle ilgili verilerin toplanması', 'İlerleme raporlarının hazırlanması ve paydaşlara sunulması.', 0, 'Achieved', '2024-08-18', '2025-07-31', 1,
    id FROM users WHERE azure_oid = 'oid-010', '2025-07-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0191', 'P24-0032', '2-Tiryaki Agro ve Anadolu Holding rapor planı & gereklilikleri için İcra onayı', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'Achieved', '2024-09-20', '2025-03-25', 2,
    id FROM users WHERE azure_oid = 'oid-010', '2025-03-25'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0192', 'P24-0032', '3-Tiryaki Anadolu Holding raporunun yazılması ve revizyonu', 'İlerleme raporlarının hazırlanması ve paydaşlara sunulması.', 0, 'Achieved', '2024-08-18', '2025-05-30', 3,
    id FROM users WHERE azure_oid = 'oid-010', '2025-05-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0193', 'P24-0032', '4-Tiryaki Agro raporunun yazılması ve revizyonların tamamlanması', 'İlerleme raporlarının hazırlanması ve paydaşlara sunulması.', 0, 'Achieved', '2025-06-17', '2026-01-15', 4,
    id FROM users WHERE azure_oid = 'oid-010', '2026-01-15'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0194', 'P24-0032', '5-Tiryaki Agro Rapor tasarım ve son onay aşaması', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'Achieved', '2025-09-15', '2026-01-15', 5,
    id FROM users WHERE azure_oid = 'oid-010', '2026-01-15'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0195', 'P24-0032', '6-Tiryaki Agro Raporun web sitelerinde yayımlanması', 'İlerleme raporlarının hazırlanması ve paydaşlara sunulması.', 0, 'Achieved', '2025-09-30', '2026-01-15', 6,
    id FROM users WHERE azure_oid = 'oid-010', '2026-01-15'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0196', 'P24-0032', '7-GRI Onayı', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'On Track', '2025-11-10', '2026-04-15', 7,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0197', 'P24-0033', '1-Proje ekibi ve planlamasının yapılması, kapsam ve hedefin net tanımlaması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-06-11', '2024-06-28', 1,
    id FROM users WHERE azure_oid = 'oid-017', '2024-06-28'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0198', 'P24-0033', '2-Piyasa en iyi uygulamaları araştırma ve analiz (uygulanabilirlik/fayda)', 'Veri toplama, analiz ve değerlendirme çalışmaları.', 0, 'On Track', '2024-07-08', '2025-05-31', 2,
    id FROM users WHERE azure_oid = 'oid-017'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0199', 'P24-0033', '3-Tiryaki uygulama önerileri ve bütçe etkilerinin çalışılması', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'On Track', '2024-10-10', '2026-05-30', 3,
    id FROM users WHERE azure_oid = 'oid-017'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0200', 'P24-0033', '4-Yönetim sunumu ve onay aşaması', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'Not Started', '2025-06-01', '2026-06-30', 4,
    id FROM users WHERE azure_oid = 'oid-017'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0201', 'P24-0033', '5-Uygulamalar için zaman/iletişim planlamaları, prosedürlerin tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-11-30', '2026-06-30', 5,
    id FROM users WHERE azure_oid = 'oid-017'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0202', 'P24-0034', '1-Konsept, İcra Kurulu Onayı ve İç İletişim', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'Achieved', '2024-10-01', '2024-12-31', 1,
    id FROM users WHERE azure_oid = 'oid-006', '2024-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0203', 'P24-0034', '2-Fiziki Alt Yapının Belirlenmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-01-01', '2026-01-01', 2,
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0204', 'P24-0034', '3-Program, Proje ve İşbirliği Başvuruları', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-01-01', '2026-01-01', 3,
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0205', 'P24-0034', '4-Fiziki Alt Yapının Tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-01-01', '2026-10-01', 4,
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A27-0206', 'P24-0034', '5-Ar-Ge Merkezi Başvurusu ve Bakanlık Onayı', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'Not Started', '2027-01-01', '2027-03-01', 5,
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0207', 'P24-0034', '6-Destek Lokasyonlarının Kurulması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-01-01', '2028-12-31', 6,
    id FROM users WHERE azure_oid = 'oid-006'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0208', 'P24-0035', '1-TDA Dijital Entegrasyonu', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-04-01', '2024-06-30', 1,
    id FROM users WHERE azure_oid = 'oid-005', '2024-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0209', 'P24-0035', '2-Tiryaki IT ile bir araya gelip Kanada, Irak ve Gana altyapıların araştırılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-04-01', '2024-06-30', 2,
    id FROM users WHERE azure_oid = 'oid-005', '2024-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0210', 'P24-0035', '3-Tiryaki Global lokasyonlardaki ilgili yöneticilerle görüşülmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-10-01', '2024-11-29', 3,
    id FROM users WHERE azure_oid = 'oid-005', '2024-11-29'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0211', 'P24-0035', '4-Tiryaki Global lokasyonlarda ilgili hukuk ekipleri ile görüşmelerin yapılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-08-04', '2025-10-31', 4,
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0212', 'P24-0035', '5-Enocta firması ile ilgili lokasyonlardaki IT ekiplerinin bir araya getirilmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-10-06', '2025-10-17', 5,
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0213', 'P24-0035', '6-Entegrasyon sürecinin yapılması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-10-06', '2025-10-31', 6,
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0214', 'P24-0036', '1-Tiryaki LTIP prosedür/genel kural ve koşullar dokümanların tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-04-01', '2024-06-30', 1,
    id FROM users WHERE azure_oid = 'oid-017', '2024-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0215', 'P24-0036', '2-Finans''tan 2024 finansalların alınması, stratejik finansal hedeflerin teyiti', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-07-16', '2024-08-15', 2,
    id FROM users WHERE azure_oid = 'oid-017', '2024-08-15'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0216', 'P24-0036', '3-2023-24 Planları-Bireysel Dağıtımların Finalize Edilerek Yönetim Onayı', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'Achieved', '2024-08-15', '2024-08-25', 3,
    id FROM users WHERE azure_oid = 'oid-017', '2024-08-25'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0217', 'P24-0036', '4-LTIP Bireysel Mektuplarının Hazırlanması ve Paylaşımı', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-08-25', '2025-11-30', 4,
    id FROM users WHERE azure_oid = 'oid-017', '2025-11-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0218', 'P25-0037', '1-Tyro HR Agent', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-10-01', '2026-03-01', 1,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0219', 'P25-0037', '2-Tyro Trader Agent', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-11-03', '2026-03-31', 2,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0220', 'P25-0037', '3-Tyro EHS Modülü', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-12-01', '2026-03-31', 3,
    id FROM users WHERE azure_oid = 'oid-007'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0221', 'P24-0038', '1-Weekly meeting with org. ukr supplier', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2024-10-01', '2025-12-31', 1,
    id FROM users WHERE azure_oid = 'oid-018'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0222', 'P24-0038', '2-Increasing our Ukrainian non-gmo soybean purchase', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2024-10-01', '2025-12-31', 2,
    id FROM users WHERE azure_oid = 'oid-018'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0223', 'P24-0039', '1-Proje ekibi ve planlamasının yapılması, kapsam ve hedefin net tanımlaması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-06-10', '2024-06-30', 1,
    id FROM users WHERE azure_oid = 'oid-017', '2024-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0224', 'P24-0039', '2-Tiryaki mevcut durum analiz ve soru seti', 'Veri toplama, analiz ve değerlendirme çalışmaları.', 0, 'Achieved', '2024-06-25', '2024-07-20', 2,
    id FROM users WHERE azure_oid = 'oid-017', '2024-07-20'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0225', 'P24-0039', '3-Çalışma modellerinin tasarlanması ve kaynak/bütçe/risk analizleri', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'On Track', '2024-07-21', '2026-04-30', 3,
    id FROM users WHERE azure_oid = 'oid-017'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0226', 'P24-0039', '4-Dokümantasyon ve süreçlerin finalize edilmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-31', '2026-06-30', 4,
    id FROM users WHERE azure_oid = 'oid-017'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0227', 'P24-0039', '5-Yönetim sunumu ve onay aşaması', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'Not Started', '2025-05-01', '2026-05-31', 5,
    id FROM users WHERE azure_oid = 'oid-017'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0228', 'P25-0040', '1-Capex bütçe onayının alınması', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'On Track', '2025-04-16', '2025-04-30', 1,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0229', 'P25-0040', '2-Tedarikçi belirlenmesi ve satınalma sürecinin tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-04-30', '2025-06-30', 2,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0230', 'P25-0040', '3-Tiryaki Yem, Lidaş sitelerinin tasarım ve kodlama', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-07-01', '2025-10-10', 3,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0231', 'P25-0040', '4-Tiryaki Anadolu web sitesinin yeni hostinge taşınması ve yayına alınması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-04-16', '2025-10-10', 4,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0232', 'P25-0040', '5-Tiryaki Agro Holding sitesinin tasarlanması ve kodlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-08-18', '2026-03-27', 5,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0233', 'P25-0041', '1-Irak, Batı Afrika, Denizcilik, Venezüella, TiryakiNuts sitelerinin tasarımı', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-11-20', '2026-04-30', 1,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0234', 'P25-0041', '2-Faz 2 sitelerinin kodlanmasının tamamlanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-11-14', '2026-05-15', 2,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0235', 'P26-0042', '1-Giresunport sitesinin taşınması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2026-02-20', '2026-04-17', 1,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0236', 'P26-0042', '2-Yıldız sitesinin dönüştürülmesi', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-12-26', '2026-03-20', 2,
    id FROM users WHERE azure_oid = 'oid-010'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0237', 'P24-0043', '1-Başvuru Ön Hazırlık', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2024-08-01', '2025-02-18', 1,
    id FROM users WHERE azure_oid = 'oid-019', '2025-02-18'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0238', 'P24-0043', '2-Bölge Müdürlüğüne Başvuru', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-02-18', '2025-02-18', 2,
    id FROM users WHERE azure_oid = 'oid-019', '2025-02-18'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0239', 'P24-0043', '3-Bölge Müdürlüğünün Başvuruyu Değerlendirmesi ve GM''ye sunması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-01-01', '2026-12-31', 3,
    id FROM users WHERE azure_oid = 'oid-019', '2026-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0240', 'P24-0043', '4-Teftiş Kurulu Başkanlığından Müfettiş Atanması', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Achieved', '2025-01-01', '2026-12-31', 4,
    id FROM users WHERE azure_oid = 'oid-019', '2026-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0241', 'P24-0043', '5-Müfettiş Yerinde İnceleme ve Değerlendirme Raporunu GM''ye Sunması', 'İlerleme raporlarının hazırlanması ve paydaşlara sunulması.', 0, 'At Risk', '2025-10-01', '2025-12-31', 5,
    id FROM users WHERE azure_oid = 'oid-019'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0242', 'P24-0043', '6-Genel Müdürlük Başvuru Değerlendirme (Onay-Red Süreci)', 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.', 0, 'At Risk', '2025-12-01', '2025-12-31', 6,
    id FROM users WHERE azure_oid = 'oid-019'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A22-0243', 'P22-0044', '1-Pilot proje hazırlığı için Muş ve Giresun lands (feasibility...)', 'Pilot ortamda test edilmesi ve geri bildirim toplanması.', 100, 'Achieved', '2022-10-15', '2024-09-30', 1,
    id FROM users WHERE azure_oid = 'oid-020', '2024-09-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A22-0244', 'P22-0044', '2-Selection of consultancy firms', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2022-10-15', '2024-09-30', 2,
    id FROM users WHERE azure_oid = 'oid-020', '2024-09-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A24-0245', 'P22-0044', '3-Carbon certification process for Tiryaki farming Lands', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 50, 'At Risk', '2024-01-01', '2026-04-01', 3,
    id FROM users WHERE azure_oid = 'oid-020'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0246', 'P22-0044', '4-Rolling out the implementation to entire Tiryaki Farming La...', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-01-01', '2027-12-31', 4,
    id FROM users WHERE azure_oid = 'oid-020'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0247', 'P22-0044', '5-Rolling out the implementation to 3rd Party Farming Lands', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-01-01', '2027-12-31', 5,
    id FROM users WHERE azure_oid = 'oid-020'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0248', 'P22-0044', '6-Carbon certification process for 3rd Party Farming Lands', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-11-01', '2026-12-31', 6,
    id FROM users WHERE azure_oid = 'oid-020'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0249', 'P22-0044', '7-Starting of Carbon Trade', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-01-01', '2026-12-31', 7,
    id FROM users WHERE azure_oid = 'oid-020'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0250', 'P14-0045', '1-Preparation for Preliminary Meeting with IFC Management', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2024-04-01', '2024-12-31', 1,
    id FROM users WHERE azure_oid = 'oid-021', '2024-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0251', 'P14-0045', '2-Preparation for Final Agreement Terms Document', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2024-04-19', '2024-10-16', 2,
    id FROM users WHERE azure_oid = 'oid-021', '2024-10-16'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0252', 'P14-0045', '3-Initiating the Process of Signing a Collaboration Agreement', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-05-01', '2025-10-22', 3,
    id FROM users WHERE azure_oid = 'oid-021', '2025-10-22'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0253', 'P14-0045', '4-MOU Process with the Port Authority', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-05-01', '2026-03-31', 4,
    id FROM users WHERE azure_oid = 'oid-021', '2026-03-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0254', 'P14-0045', '5-Land selection', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-05-01', '2025-11-30', 5,
    id FROM users WHERE azure_oid = 'oid-021', '2025-11-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0255', 'P14-0045', '6-Technical design (detailed version)', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-01', '2026-03-31', 6,
    id FROM users WHERE azure_oid = 'oid-021'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0256', 'P14-0045', '7-Operational Feasibility (detailed version)', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-01', '2026-03-31', 7,
    id FROM users WHERE azure_oid = 'oid-021'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0257', 'P14-0045', '8-Financial Feasibility (detailed version)', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-01', '2026-03-31', 8,
    id FROM users WHERE azure_oid = 'oid-021'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0258', 'P14-0045', '9-Final approvals of Management', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-01', '2026-03-31', 9,
    id FROM users WHERE azure_oid = 'oid-021'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0259', 'P14-0045', '10-Investment Processes (Supply, construction, agreements...)', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-11-01', '2027-12-31', 10,
    id FROM users WHERE azure_oid = 'oid-021'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A23-0260', 'P23-0046', '1-Feasibility Study', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2023-07-01', '2023-10-31', 1,
    id FROM users WHERE azure_oid = 'oid-022', '2023-10-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A23-0261', 'P23-0046', '2-Financial Feasibility Study', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2023-07-01', '2024-01-01', 2,
    id FROM users WHERE azure_oid = 'oid-022', '2024-01-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0262', 'P23-0046', '3-Letter of Intent submission to the port', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-01-01', '2026-12-31', 3,
    id FROM users WHERE azure_oid = 'oid-022', '2026-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0263', 'P23-0046', '4-Negotiation with the port authority', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-01-01', '2025-06-30', 4,
    id FROM users WHERE azure_oid = 'oid-022', '2025-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0264', 'P23-0046', '5-Signing with the port authority', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-07-01', '2026-10-31', 5,
    id FROM users WHERE azure_oid = 'oid-022'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0265', 'P23-0046', '6-Construction Period', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-01', '2027-12-31', 6,
    id FROM users WHERE azure_oid = 'oid-022'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A25-0266', 'P25-0047', '1-Feasibility and Market Analysis', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2025-01-01', '2026-12-31', 1,
    id FROM users WHERE azure_oid = 'oid-021', '2026-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0267', 'P25-0047', '2-Regulatory and Stakeholder Engagement', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'At Risk', '2025-01-01', '2026-03-31', 2,
    id FROM users WHERE azure_oid = 'oid-021'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0268', 'P25-0047', '3-Technology Selection and Plant Design', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-01-01', '2026-03-31', 3,
    id FROM users WHERE azure_oid = 'oid-021'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0269', 'P25-0047', '4-Financing and Partnerships', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-06-01', '2026-06-30', 4,
    id FROM users WHERE azure_oid = 'oid-021'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0270', 'P25-0047', '5-Construction and Commissioning', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-04-01', '2026-12-31', 5,
    id FROM users WHERE azure_oid = 'oid-021'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A27-0271', 'P25-0047', '6-Commercial Operations and Regional Integration', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2027-07-01', '2026-12-31', 6,
    id FROM users WHERE azure_oid = 'oid-021'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A26-0272', 'P26-0048', '1-Conceptual design, Approval of the GMs and shareholding', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2026-01-01', '2027-12-31', 1,
    id FROM users WHERE azure_oid = 'oid-023', '2027-12-31'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0273', 'P26-0048', '2-Establishing the AgroHolding', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-10-01', '2026-06-14', 2,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0274', 'P26-0048', '3-Presenting the Project to the government', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-06-14', '2026-03-30', 3,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0275', 'P26-0048', '4-Subsidizing the Project to the international and local banks', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-01', '2026-06-30', 4,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0276', 'P26-0048', '5-Execution of the contract with the government for privileges', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-01', '2026-06-30', 5,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0277', 'P26-0048', '6-Subsidizing the Project to the international and local banks', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-01', '2026-06-30', 6,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0278', 'P26-0048', '7-Starting the Project engineering phase', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-01', '2026-09-01', 7,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0279', 'P26-0048', '8-Constructing investment in accordance with the approvals...', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-09-01', '2027-12-31', 8,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0280', 'P24-0049', '1-Completion of technical and mandatory OHS training', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2024-05-31', '2024-06-30', 1,
    id FROM users WHERE azure_oid = 'oid-005', '2024-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A24-0281', 'P24-0049', '2-Leadership and Personal Development Trainings', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2024-05-31', '2024-06-30', 2,
    id FROM users WHERE azure_oid = 'oid-005', '2024-06-30'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0282', 'P24-0049', '3-Monthly routines reporting structure to be set', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2026-01-01', '2026-05-20', 3,
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0283', 'P24-0049', '4-Hire Future Leader', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-11-19', '2026-06-30', 4,
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id, completed_at)
  SELECT 'A26-0284', 'P26-0050', '1-Establishing the org. structure, designing org charts with a..', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 100, 'Achieved', '2026-04-04', '2024-10-01', 1,
    id FROM users WHERE azure_oid = 'oid-005', '2024-10-01'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0285', 'P26-0050', '2-Filling the vacant positions of 4 employees', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2026-11-16', '2026-12-31', 2,
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0286', 'P26-0050', '3-Designing Africa remuneration and benefits strategies', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-05-01', '2026-06-30', 3,
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0287', 'P26-0050', '4-Nigeria task', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-04-19', '2026-12-31', 4,
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0288', 'P26-0050', '5-Guinea visit', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2025-01-01', '2026-12-31', 5,
    id FROM users WHERE azure_oid = 'oid-005'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0289', 'P25-0051', '1-Site Assessment and Resource Evaluation', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-07-01', '2026-05-31', 1,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A25-0290', 'P25-0051', '2-Identification of Investment and Capacity Requirements', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2025-01-01', '2025-10-31', 2,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0291', 'P25-0051', '3-Final Financial and Environmental Studies', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'On Track', '2026-03-01', '2026-05-15', 3,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0292', 'P25-0051', '4-Consultation and Agreement Processes with Authorities', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-01', '2026-06-30', 4,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0293', 'P25-0051', '5-Detailed Investments and Engineering Planning', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-03-01', '2026-06-30', 5,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0294', 'P25-0051', '6-Procurement and Logistics Preparation', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-05-01', '2026-11-30', 6,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0295', 'P25-0051', '7-Equipment and Facility Installation', 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.', 0, 'Not Started', '2026-05-01', '2026-11-30', 7,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id)
  SELECT 'A26-0296', 'P25-0051', '8-Testing, Commissioning and Start of Operations', 'Pilot ortamda test edilmesi ve geri bildirim toplanması.', 0, 'Not Started', '2026-03-01', '2028-12-31', 8,
    id FROM users WHERE azure_oid = 'oid-023'
  ON CONFLICT (id) DO NOTHING;

-- 5. ROLE PERMISSIONS
INSERT INTO role_permissions (role, permissions) VALUES
  ('Admin', '{"canViewAll": true, "canEditAll": true, "canDeleteAll": true, "canCreateProje": true, "canCreateAksiyon": true}'::jsonb),
  ('Proje Lideri', '{"canViewAll": false, "canEditOwn": true, "canDeleteOwn": false, "canCreateProje": false, "canCreateAksiyon": true}'::jsonb),
  ('Kullanıcı', '{"canViewAll": false, "canEditOwn": true, "canDeleteOwn": false, "canCreateProje": false, "canCreateAksiyon": false}'::jsonb)
ON CONFLICT (role) DO NOTHING;

-- 6. APP SETTINGS
INSERT INTO app_settings (key, value) VALUES
  ('companyName', '"Tiryaki Agro"'::jsonb),
  ('idTemplate', '{"proje": "P{YY}-{NNNN}", "aksiyon": "A{YY}-{NNNN}"}'::jsonb)
ON CONFLICT (key) DO NOTHING;

-- Stats: 50 projeler, 296 aksiyonlar, 24 users
