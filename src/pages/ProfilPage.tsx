import { useTranslation } from "react-i18next";
import { Select, SelectItem } from "@heroui/react";
import { useUIStore } from "@/stores/uiStore";
import { useDataStore } from "@/stores/dataStore";
import { useSidebarTheme } from "@/hooks/useSidebarTheme";
import { useCurrentUser } from "@/hooks/useCurrentUser";
import PageHeader from "@/components/layout/PageHeader";

export default function ProfilPage() {
  const { t } = useTranslation();
  const { locale, setLocale } = useUIStore();
  const sidebarTheme = useSidebarTheme();
  const currentUser = useCurrentUser();
  const updateUser = useDataStore((s) => s.updateUser);
  const users = useDataStore((s) => s.users);

  // Find DB user record for locale update
  const dbUser = users.find((u) => u.displayName === currentUser.name);

  const handleLocaleChange = (newLocale: "tr" | "en") => {
    setLocale(newLocale);
    // Also persist to DB if user record exists
    if (dbUser) {
      updateUser(dbUser.id, { locale: newLocale });
    }
  };

  const initials = currentUser.name
    .split(" ")
    .map((w) => w[0])
    .join("")
    .toUpperCase()
    .slice(0, 2);

  return (
    <div>
      <PageHeader title={t("profile.title")} subtitle={t("profile.title")} />

      <div className="flex flex-col gap-4">
        {/* Profile Card — themed header */}
        <div className="rounded-2xl overflow-hidden bg-white/70 dark:bg-white/5 backdrop-blur-xl border border-white/40 dark:border-white/10 shadow-[0_2px_16px_rgba(0,0,0,0.04)]">
          {/* Cover — sidebar themed */}
          <div className="relative h-28 overflow-hidden" style={{ background: sidebarTheme.bg }}>
            <div className="absolute inset-0 opacity-[0.06]" style={{
              backgroundImage: `radial-gradient(circle at 1px 1px, ${sidebarTheme.accentColor ?? "rgba(255,255,255,0.4)"} 1px, transparent 0)`,
              backgroundSize: "20px 20px",
            }} />
            <div className="absolute -top-8 -right-8 w-32 h-32 rounded-full blur-3xl opacity-20" style={{ backgroundColor: sidebarTheme.accentColor ?? "#c8922a" }} />
          </div>

          {/* Avatar */}
          <div className="flex justify-center -mt-12">
            <div className="w-24 h-24 rounded-full flex items-center justify-center text-white text-2xl font-bold border-4 border-white dark:border-tyro-surface shadow-lg"
              style={{ backgroundColor: sidebarTheme.accentColor ?? "#c8922a" }}>
              {initials}
            </div>
          </div>

          {/* Info */}
          <div className="px-6 pt-3 pb-6">
            <div className="text-center mb-5">
              <h2 className="text-[18px] font-bold text-tyro-text-primary">{currentUser.name}</h2>
              <p className="text-[13px] text-tyro-text-muted mt-0.5">{currentUser.email}</p>
            </div>

            {/* Info Grid — readonly */}
            <div className="rounded-xl bg-tyro-bg/50 border border-tyro-border/20 overflow-hidden divide-y divide-tyro-border/15">
              <div className="grid grid-cols-2 divide-x divide-tyro-border/15">
                <InfoCell label={t("profile.department")} value={currentUser.department || "—"} />
                <InfoCell label={t("profile.authRole")} value={currentUser.role} />
              </div>
              <div className="grid grid-cols-2 divide-x divide-tyro-border/15">
                <InfoCell label={t("profile.email")} value={currentUser.email} />
                <InfoCell label="ID" value={dbUser?.id?.slice(0, 8) ?? "—"} mono />
              </div>
            </div>

            {/* Language — editable */}
            <div className="mt-5">
              <label className="block text-[12px] font-semibold text-tyro-text-secondary mb-1.5">{t("profile.language")}</label>
              <Select
                selectedKeys={[locale]}
                onSelectionChange={(keys) => {
                  const val = Array.from(keys)[0] as "tr" | "en";
                  if (val) handleLocaleChange(val);
                }}
                variant="bordered"
                size="sm"
                classNames={{ trigger: "border-tyro-border", value: "font-semibold text-tyro-text-primary" }}
              >
                <SelectItem key="tr">{t("profile.turkish")}</SelectItem>
                <SelectItem key="en">{t("profile.english")}</SelectItem>
              </Select>
              <p className="text-[11px] text-tyro-text-muted mt-1.5">
                Dil tercihiniz kaydedilir ve bir sonraki girişinizde otomatik uygulanır.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

function InfoCell({ label, value, mono }: { label: string; value: string; mono?: boolean }) {
  return (
    <div className="px-3.5 py-2.5">
      <span className="text-[10px] font-semibold uppercase tracking-wider text-tyro-text-muted/70 block mb-1">{label}</span>
      <p className={`text-[12px] font-semibold ${mono ? "font-mono text-tyro-text-secondary tabular-nums" : "text-tyro-text-primary"}`}>
        {value || "—"}
      </p>
    </div>
  );
}
