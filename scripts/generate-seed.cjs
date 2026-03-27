/**
 * Generates Supabase seed SQL from the app's mock data.
 * Run: node scripts/generate-seed.cjs
 * Then paste output into Supabase SQL Editor.
 */

// We can't import TS directly, so we'll use the app's build output.
// Instead, we'll generate from the parsed Excel data.

const fs = require('fs');
const ExcelJS = require('exceljs');
const wb = new ExcelJS.Workbook();

const trMonths = { Oca: '01', 'Şub': '02', Mar: '03', Nis: '04', May: '05', Haz: '06', Tem: '07', 'Ağu': '08', Eyl: '09', Eki: '10', Kas: '11', Ara: '12' };

function parseDate(v) {
  if (!v) return null;
  if (v instanceof Date) return v.toISOString().slice(0, 10);
  const s = String(v).trim();
  let m = s.match(/^(\d{1,2})\.(\d{1,2})\.(\d{4})$/);
  if (m) return m[3] + '-' + m[2].padStart(2, '0') + '-' + m[1].padStart(2, '0');
  m = s.match(/^(\d{1,2})\.(\w+)\.(\d{4})$/);
  if (m && trMonths[m[2]]) return m[3] + '-' + trMonths[m[2]] + '-' + m[1].padStart(2, '0');
  m = s.match(/^(\d{1,2})\/(\d{1,2})\/(\d{4})$/);
  if (m) return m[3] + '-' + m[1].padStart(2, '0') + '-' + m[2].padStart(2, '0');
  return null;
}

function esc(s) { return s.replace(/'/g, "''"); }

function computeReviewDate(endDate) {
  if (!endDate) return null;
  const d = new Date(endDate);
  d.setMonth(d.getMonth() - 1);
  return d.toISOString().slice(0, 10);
}

// Description generators (same logic as mock-adapter)
function projeDesc(name, source) {
  const n = name.toLowerCase();
  if (n.includes('fıstık') || n.includes('çin')) return 'Antep fıstığı ürünlerinin Çin pazarına girişi için pazar araştırması ve dağıtım ağının kurulması.';
  if (n.includes('sulama')) return 'Modern sulama altyapısı ile tarımsal verimliliğin artırılması ve su kaynaklarının etkin yönetimi.';
  if (n.includes('mekanizasyon')) return 'Tarımsal mekanizasyon kapasitesinin güçlendirilmesi ve modern ekipman temini.';
  if (n.includes('gemi') || n.includes('deniz')) return 'Deniz-Nehir tipi gemi inşa projesi kapsamında tersane seçimi ve inşaat sürecinin takibi.';
  if (n.includes('performans yönetim')) return 'Bireysel performans yönetim sisteminin tasarlanması ve devreye alınması.';
  if (n.includes('farmerp') || n.includes('çiftlik')) return 'Çiftlik yönetim sistemi FarmERP entegrasyonunun tamamlanması.';
  if (n.includes('itsm')) return 'BT servis yönetimi platformunun kurulması ve süreç otomasyonu.';
  if (n.includes('carbon')) return 'Karbon ticareti projesi kapsamında pilot saha hazırlığı ve sertifikasyon.';
  if (n.includes('iraq agro')) return 'Irak Agro Holding yapılanması ve tarımsal operasyonların konsolidasyonu.';
  return source + ' stratejik projeleri kapsamında planlanan çalışmaların yürütülmesi.';
}

function aksiyonDesc(name) {
  const n = name.toLowerCase();
  if (n.includes('fizibilite')) return 'Fizibilite çalışmasının hazırlanması ve karar raporunun sunulması.';
  if (n.includes('bütçe') || n.includes('onay')) return 'Bütçe taslağının hazırlanması ve yönetim onayının alınması.';
  if (n.includes('test') || n.includes('pilot')) return 'Pilot ortamda test edilmesi ve geri bildirim toplanması.';
  if (n.includes('eğitim')) return 'Kullanıcı eğitimlerinin planlanması ve gerçekleştirilmesi.';
  if (n.includes('analiz') || n.includes('araştırma')) return 'Veri toplama, analiz ve değerlendirme çalışmaları.';
  if (n.includes('kurulum') || n.includes('devreye')) return 'Sistem kurulumu ve canlıya alma sürecinin yönetimi.';
  if (n.includes('rapor')) return 'İlerleme raporlarının hazırlanması ve paydaşlara sunulması.';
  return 'Belirlenen zaman çizelgesine uygun olarak görevin tamamlanması.';
}

// Tag assignment
function assignTag(name, progress, status) {
  if ((status === 'Behind' || status === 'At Risk') && name.length % 3 === 0) return 'Uygulama';
  if (status === 'Not Started' || progress === 0) return 'Ön Çalışma';
  if (status === 'Achieved' || progress >= 80) return 'Uygulama';
  return 'Geliştirme';
}

// Department by leader
const DEPT_MAP = {
  'Ozan Yeşilyer': 'Tarım', 'Recep Mergen': 'Tarım', 'Taylan Eğilmez': 'Ticaret',
  'İdris İlhan Telci': 'Denizcilik', 'Güven Emrah Erenler': 'İnsan Kaynakları',
  'Suat Söbüçovalı': 'Ar-Ge', 'Kerime İkizler': 'Bilgi Teknolojileri',
  'Murat Solak': 'Üretim', 'Nazlı Deniz Çetin': 'Risk Yönetimi',
  'Arzu Örsel': 'Kurumsal İletişim', 'Burcu Gözen': 'Finans',
  'Kübra Dömbek': 'Kalite', 'Devrim Aşkın': 'Finans',
  'Tamer Latifoğlu': 'Dış Ticaret', 'Emre Padar': 'Üretim',
  'Yiğit Karacı': 'Uluslararası Operasyonlar', 'Tarkan Ferhat Yılmaz': 'İnsan Kaynakları',
  'Raif Karacı': 'Uluslararası Operasyonlar',
  'Kemal Yıldız': 'Uluslararası Operasyonlar', 'Nevzat Çakmak': 'Uluslararası Operasyonlar',
  'Fatih Tiryakioğlu': 'Yönetim', 'Bahadır Açık': 'Uluslararası Operasyonlar',
  'Ahmet Kalkan / Halil İbrahim Öztürk': 'İş Güvenliği',
};

const FILE = 'C:/Users/Cenk/Desktop/Cascade Subat2026 Projeler Listesi.xlsx';

wb.xlsx.readFile(FILE).then(() => {
  const projeler = [];
  const aksiyonlar = [];
  let gIdx = 0;

  const sheets = [
    ['Türkiye - Şubat 2026', 'K' !== 'K', 'Türkiye'],
    ['Kurumsal - Şubat 2026', true, 'Kurumsal'],
    ['International - Feb 2026', false, 'International'],
  ];

  for (const [sheetName, isK, source] of sheets) {
    const ws = wb.getWorksheet(sheetName);
    let curH = null, curP = null, multiFaz = false, fazP = null, tIdx = 0;

    for (let r = 2; r <= ws.rowCount; r++) {
      const row = ws.getRow(r);
      const tn = String(row.getCell(4).value || '').trim();
      const lv = String(row.getCell(5).value || '').trim();
      if (!tn) continue;

      let prog, st, sd, ed, ld;
      if (isK) {
        prog = 0; st = String(row.getCell(6).value || 'Not Started').trim();
        sd = parseDate(row.getCell(7).value); ed = parseDate(row.getCell(8).value);
        ld = String(row.getCell(9).value || '').trim();
      } else {
        prog = parseInt(row.getCell(6).value) || 0;
        st = String(row.getCell(7).value || 'Not Started').trim();
        sd = parseDate(row.getCell(8).value); ed = parseDate(row.getCell(9).value);
        ld = String(row.getCell(10).value || '').trim();
      }

      if (lv === 'Hedef') {
        if (curH && !multiFaz) projeler.push(curH);
        gIdx++; tIdx = 0; multiFaz = false; fazP = null; curP = null;
        const yr = (sd || '2025-01-01').substring(2, 4);
        curH = { id: 'P' + yr + '-' + String(gIdx).padStart(4, '0'), name: tn, source, status: st, sd: sd || '2025-01-01', ed: ed || '2026-12-31', ld, dept: DEPT_MAP[ld] || source };
      } else if (lv === 'Proje') {
        if (isK) {
          gIdx++; tIdx = 0;
          const yr = (sd || '2025-01-01').substring(2, 4);
          curP = { id: 'P' + yr + '-' + String(gIdx).padStart(4, '0'), name: tn, source, status: st, sd: sd || '2025-01-01', ed: ed || '2026-12-31', ld, dept: DEPT_MAP[ld] || source };
          projeler.push(curP);
        } else {
          const isFaz = /faz\s*\d|phase\s*\d/i.test(tn);
          if (isFaz || curP) {
            if (!multiFaz) { multiFaz = true; }
            gIdx++; tIdx = 0;
            const yr = (sd || curH?.sd || '2025-01-01').substring(2, 4);
            fazP = { id: 'P' + yr + '-' + String(gIdx).padStart(4, '0'), name: tn, source, status: st || curH?.status, sd: sd || curH?.sd || '2025-01-01', ed: ed || curH?.ed || '2026-12-31', ld: ld || curH?.ld, dept: DEPT_MAP[ld || curH?.ld] || source };
            projeler.push(fazP);
          } else {
            curP = { ld: ld || curH?.ld };
          }
        }
      } else if (lv === 'Alt Görev') {
        tIdx++;
        const parentId = (isK && curP) ? curP.id : (multiFaz && fazP) ? fazP.id : curH?.id;
        const parentLd = (isK && curP) ? curP.ld : (multiFaz && fazP) ? fazP.ld : curH?.ld;
        const yr = (sd || '2025-01-01').substring(2, 4);
        aksiyonlar.push({
          id: 'A' + yr + '-' + String(aksiyonlar.length + 1).padStart(4, '0'),
          projeId: parentId,
          name: tn, prog, status: st,
          sd: sd || '2025-01-01', ed: ed || '2026-12-31',
          ld: ld || parentLd || '',
          sortOrder: tIdx,
        });
      }
    }
    if (!isK && curH && !multiFaz) projeler.push(curH);
  }

  // Generate SQL
  let sql = '-- Supabase Seed Data - Generated from Cascade Excel Şubat 2026\n';
  sql += '-- Run in Supabase SQL Editor\n\n';

  // 1. Users (unique leaders)
  const leaders = new Set();
  for (const p of projeler) if (p.ld) leaders.add(p.ld);
  for (const a of aksiyonlar) if (a.ld) leaders.add(a.ld);
  leaders.add('Cenk Şayli');

  sql += '-- 1. USERS\n';
  sql += 'INSERT INTO users (azure_oid, email, display_name, department, role) VALUES\n';
  const userRows = [];
  let userIdx = 0;
  const userMap = new Map(); // name -> azure_oid
  for (const name of leaders) {
    userIdx++;
    const oid = 'oid-' + String(userIdx).padStart(3, '0');
    const email = name.toLowerCase().replace(/\s+/g, '.').replace(/[öÖ]/g, 'o').replace(/[üÜ]/g, 'u').replace(/[çÇ]/g, 'c').replace(/[şŞ]/g, 's').replace(/[ığİĞ]/g, 'i').replace(/[^a-z.\/]/g, '') + '@tiryaki.com.tr';
    const dept = DEPT_MAP[name] || 'Genel';
    const role = name === 'Cenk Şayli' ? 'Admin' : 'Proje Lideri';
    userRows.push(`  ('${oid}', '${esc(email)}', '${esc(name)}', '${esc(dept)}', '${role}')`);
    userMap.set(name, oid);
  }
  sql += userRows.join(',\n') + '\nON CONFLICT (azure_oid) DO NOTHING;\n\n';

  // 2. Tag definitions
  sql += '-- 2. TAG DEFINITIONS\n';
  sql += "INSERT INTO tag_definitions (id, name, color) VALUES\n";
  sql += "  (gen_random_uuid(), 'Ön Çalışma', '#D4A017'),\n";
  sql += "  (gen_random_uuid(), 'Geliştirme', '#3b82f6'),\n";
  sql += "  (gen_random_uuid(), 'Uygulama', '#10b981')\n";
  sql += "ON CONFLICT (name) DO NOTHING;\n\n";

  // 3. Projeler
  sql += '-- 3. PROJELER (' + projeler.length + ')\n';
  for (const p of projeler) {
    const desc = projeDesc(p.name, p.source);
    const reviewDate = computeReviewDate(p.ed);
    sql += `INSERT INTO projeler (id, name, description, source, status, progress, department, start_date, end_date, review_date, owner_id)\n`;
    sql += `  SELECT '${p.id}', '${esc(p.name)}', '${esc(desc)}', '${p.source}', '${p.status}', 0, '${esc(p.dept)}', '${p.sd}', '${p.ed}', ${reviewDate ? "'" + reviewDate + "'" : 'NULL'},\n`;
    sql += `    id FROM users WHERE azure_oid = '${userMap.get(p.ld) || 'oid-001'}'\n`;
    sql += `  ON CONFLICT (id) DO NOTHING;\n\n`;
  }

  // 4. Aksiyonlar
  sql += '-- 4. AKSIYONLAR (' + aksiyonlar.length + ')\n';
  for (const a of aksiyonlar) {
    const desc = aksiyonDesc(a.name);
    sql += `INSERT INTO aksiyonlar (id, proje_id, name, description, progress, status, start_date, end_date, sort_order, owner_id${a.status === 'Achieved' ? ', completed_at' : ''})\n`;
    sql += `  SELECT '${a.id}', '${a.projeId}', '${esc(a.name)}', '${esc(desc)}', ${a.prog}, '${a.status}', '${a.sd}', '${a.ed}', ${a.sortOrder},\n`;
    sql += `    id FROM users WHERE azure_oid = '${userMap.get(a.ld) || 'oid-001'}'${a.status === 'Achieved' ? ", '" + a.ed + "'" : ''}\n`;
    sql += `  ON CONFLICT (id) DO NOTHING;\n\n`;
  }

  // 5. Role permissions
  sql += '-- 5. ROLE PERMISSIONS\n';
  sql += `INSERT INTO role_permissions (role, permissions) VALUES\n`;
  sql += `  ('Admin', '{"canViewAll": true, "canEditAll": true, "canDeleteAll": true, "canCreateProje": true, "canCreateAksiyon": true}'::jsonb),\n`;
  sql += `  ('Proje Lideri', '{"canViewAll": false, "canEditOwn": true, "canDeleteOwn": false, "canCreateProje": false, "canCreateAksiyon": true}'::jsonb),\n`;
  sql += `  ('Kullanıcı', '{"canViewAll": false, "canEditOwn": true, "canDeleteOwn": false, "canCreateProje": false, "canCreateAksiyon": false}'::jsonb)\n`;
  sql += `ON CONFLICT (role) DO NOTHING;\n\n`;

  // 6. App settings
  sql += '-- 6. APP SETTINGS\n';
  sql += `INSERT INTO app_settings (key, value) VALUES\n`;
  sql += `  ('companyName', '"Tiryaki Agro"'::jsonb),\n`;
  sql += `  ('idTemplate', '{"proje": "P{YY}-{NNNN}", "aksiyon": "A{YY}-{NNNN}"}'::jsonb)\n`;
  sql += `ON CONFLICT (key) DO NOTHING;\n\n`;

  sql += '-- Stats: ' + projeler.length + ' projeler, ' + aksiyonlar.length + ' aksiyonlar, ' + leaders.size + ' users\n';

  fs.writeFileSync('scripts/seed-data.sql', sql, 'utf8');
  console.log('Written scripts/seed-data.sql');
  console.log('Projeler:', projeler.length, 'Aksiyonlar:', aksiyonlar.length, 'Users:', leaders.size);
  console.log('SQL size:', (sql.length / 1024).toFixed(1) + ' KB');
}).catch(e => console.error(e));
