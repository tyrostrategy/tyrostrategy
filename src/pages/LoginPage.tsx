import { Button } from "@heroui/react";
import { useTranslation } from "react-i18next";
import { motion, AnimatePresence } from "framer-motion";
import { Shield, BarChart3, Target, LayoutDashboard, Globe, Sun, Moon } from "lucide-react";
import { TyroLogo } from "@/components/ui/TyroLogo";
import { useUIStore } from "@/stores/uiStore";
import { useMsalLogin, resolveUser, applyUser } from "@/hooks/useMsalLogin";
import { useIsAuthenticated, useMsal } from "@azure/msal-react";
import { InteractionStatus } from "@azure/msal-browser";
import { useNavigate } from "react-router-dom";
import { useDataStore } from "@/stores/dataStore";
import { useState, useEffect } from "react";
import { AuroraBackground } from "@/components/ui/aceternity/aurora-background";
import { cn } from "@/lib/cn";

function MicrosoftIcon() {
  return (
    <svg width="18" height="18" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
      <rect x="1" y="1" width="9" height="9" fill="#f25022" />
      <rect x="11" y="1" width="9" height="9" fill="#7fba00" />
      <rect x="1" y="11" width="9" height="9" fill="#00a4ef" />
      <rect x="11" y="11" width="9" height="9" fill="#ffb900" />
    </svg>
  );
}

const COPYRIGHT = "© 2026 Powered by TTECH Business Solutions · Tiryaki Agro";

/* Aurora gradient class — reused in logo, headline, feature icons */
const AURORA_GRADIENT = "bg-gradient-to-r from-emerald-400 via-blue-500 to-violet-500";

/* Aurora colors for TyroLogo SVG */
const AURORA_LOGO_COLORS = {
  gradStart: "#34d399", // emerald
  gradEnd: "#10b981",   // emerald darker
  fillA: "#6366f1",     // violet — sağ alt
  fillB: "#3b82f6",     // blue — ana üst
  fillC: "#8b5cf6",     // violet — gölge
};

type LoginTheme = "light" | "dark";

export default function LoginPage() {
  const { t } = useTranslation();
  const { locale, setLocale } = useUIStore();
  const { login: msalLogin, loading: msalLoading, error: msalError } = useMsalLogin();
  const [featureIndex, setFeatureIndex] = useState(0);
  const [loginTheme, setLoginTheme] = useState<LoginTheme>(
    () => (localStorage.getItem("tyro-login-theme") as LoginTheme) || "light",
  );

  const isDark = loginTheme === "dark";

  const toggleLoginTheme = () => {
    const next: LoginTheme = isDark ? "light" : "dark";
    setLoginTheme(next);
    localStorage.setItem("tyro-login-theme", next);
  };

  // Handle redirect return (mobile MSAL flow)
  const isAuthenticated = useIsAuthenticated();
  const { accounts, inProgress } = useMsal();
  const mockLoggedIn = useUIStore((s) => s.mockLoggedIn);
  const users = useDataStore((s) => s.users);
  const navigate = useNavigate();

  useEffect(() => {
    if (!isAuthenticated || mockLoggedIn || accounts.length === 0) return;
    if (inProgress !== InteractionStatus.None) return;
    if (users.length === 0) return;
    const email = accounts[0].username.toLowerCase().trim();
    const user = resolveUser(email, users);
    if (user) {
      applyUser(user);
      navigate("/workspace", { replace: true });
    }
  }, [isAuthenticated, mockLoggedIn, accounts, users, inProgress, navigate]);

  const features = [
    { icon: Target, title: t("login.strategicPlanning"), desc: t("login.strategicPlanningDesc") },
    { icon: BarChart3, title: t("login.kpiDashboard"), desc: t("login.kpiDashboardDesc") },
    { icon: LayoutDashboard, title: t("login.teamManagement"), desc: t("login.teamManagementDesc") },
    { icon: Shield, title: t("login.corporateSecurity"), desc: t("login.corporateSecurityDesc") },
  ];

  useEffect(() => {
    const timer = setInterval(() => setFeatureIndex((i) => (i + 1) % features.length), 3000);
    return () => clearInterval(timer);
  }, []);

  /* ── Theme-dependent color tokens ── */
  const c = isDark
    ? {
        // DARK — blue-gradient premium (navy → blue with gold accents)
        text: "text-[#f1f5f9]",
        textSub: "text-[#c5d8ec]",
        textMuted: "text-[#97b8d8]",
        logoText: "text-white",
        logoAccent: "bg-gradient-to-r from-tyro-gold-light to-tyro-gold bg-clip-text text-transparent",
        headline: "bg-gradient-to-r from-[#e0ad3e] via-[#f0c95e] to-[#e0ad3e] bg-clip-text text-transparent",
        featureIconActive: "bg-gradient-to-br from-[#e0ad3e]/20 to-[#3b6ba5]/20 border border-[#e0ad3e]/10",
        featureIconPassive: "bg-white/[0.08] border border-white/[0.04]",
        featureIconColor: "text-[#e0ad3e]",
        featureActiveBg: "bg-white/[0.08] backdrop-blur-sm border-white/[0.05]",
        borderT: "border-white/[0.06]",
        copyright: "text-[#97b8d8]/50",
        cardBorder:
          "conic-gradient(from var(--login-border-angle, 0deg), #3b6ba5, #e0ad3e, #5a8ec4, #c8922a, #3b6ba5)",
        cardBg: "rgba(26,51,88,0.85)",
        cardSubtitle: "text-[#c5d8ec]",
        cardHeading: "text-white",
        cardInfoBg: "linear-gradient(135deg, rgba(42,79,127,0.5), rgba(30,58,95,0.4))",
        cardInfoBorder: "border-[#3b6ba5]/20",
        cardInfoIcon: "bg-[#3b6ba5]/30",
        cardInfoIconColor: "text-[#e0ad3e]",
        cardInfoText: "text-[#97b8d8]",
        cardShieldBg: "linear-gradient(135deg, rgba(59,107,165,0.15), rgba(224,173,62,0.1))",
        cardShieldBorder: "border-[#3b6ba5]/20",
        cardShieldColor: "text-[#e0ad3e]",
        cardLangBg: "bg-white/[0.06] border-white/[0.08]",
        cardLangActive: "bg-white/[0.12] text-white shadow-sm",
        cardLangInactive: "text-[#97b8d8] hover:text-white",
        cardDividerColor: "#97b8d8",
        liquidA: "radial-gradient(circle, #3b6ba5 0%, transparent 70%)",
        liquidB: "radial-gradient(circle, #e0ad3e 0%, transparent 70%)",
        liquidC: "radial-gradient(circle, #5a8ec4 0%, transparent 70%)",
        toggleBg: "bg-white/[0.08] hover:bg-white/[0.12]",
        toggleColor: "text-white/70",
        mobileFeatureIconBg: "bg-white/[0.08]",
        mobileFeatureText: "text-[#97b8d8]",
      }
    : {
        // LIGHT — aurora gradient palette (emerald/blue/violet)
        text: "text-slate-900",
        textSub: "text-slate-500",
        textMuted: "text-slate-400",
        logoText: "text-slate-800",
        logoAccent: `${AURORA_GRADIENT} bg-clip-text text-transparent`,
        headline: `${AURORA_GRADIENT} bg-clip-text text-transparent`,
        featureIconActive: "bg-gradient-to-br from-emerald-400/25 to-blue-400/20 shadow-sm shadow-emerald-200/30 border border-emerald-200/20",
        featureIconPassive: "bg-white/50 border border-white/60",
        featureIconColor: "text-emerald-600",
        featureActiveBg: "bg-white/70 shadow-md shadow-emerald-100/40 backdrop-blur-sm border-emerald-200/30",
        borderT: "border-slate-200/60",
        copyright: "text-slate-400",
        cardBorder:
          "conic-gradient(from var(--login-border-angle, 0deg), #93c5fd, #60a5fa, #a78bfa, #c4b5fd, #93c5fd)",
        cardBg: "rgba(255,255,255,0.96)",
        cardSubtitle: "text-slate-500",
        cardHeading: "text-slate-800",
        cardInfoBg: "linear-gradient(135deg, rgba(241,245,249,0.7), rgba(248,250,252,0.5))",
        cardInfoBorder: "border-slate-200/40",
        cardInfoIcon: "bg-blue-50",
        cardInfoIconColor: "text-blue-400",
        cardInfoText: "text-slate-400",
        cardShieldBg: "linear-gradient(135deg, rgba(147,197,253,0.15), rgba(167,139,250,0.12))",
        cardShieldBorder: "border-blue-200/20",
        cardShieldColor: "text-blue-500",
        cardLangBg: "bg-slate-100/80 border-slate-200/50",
        cardLangActive: "bg-white text-slate-800 shadow-sm",
        cardLangInactive: "text-slate-400 hover:text-slate-600",
        cardDividerColor: "#cbd5e1",
        liquidA: "radial-gradient(circle, #93c5fd 0%, transparent 70%)",
        liquidB: "radial-gradient(circle, #c4b5fd 0%, transparent 70%)",
        liquidC: "radial-gradient(circle, #a5b4fc 0%, transparent 70%)",
        toggleBg: "bg-white/70 hover:bg-white/90",
        toggleColor: "text-slate-600",
        mobileFeatureIconBg: "bg-slate-100",
        mobileFeatureText: "text-slate-500",
      };

  return (
    <AuroraBackground className="min-h-screen" variant={loginTheme}>
      <motion.div
        className="min-h-screen flex"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.6 }}
      >
        {/* ===== THEME TOGGLE — top right ===== */}
        <motion.button
          type="button"
          onClick={toggleLoginTheme}
          className={cn(
            "absolute top-5 right-5 z-20 w-10 h-10 rounded-xl flex items-center justify-center",
            "backdrop-blur-md transition-all duration-300 cursor-pointer border border-white/30",
            "shadow-sm",
            c.toggleBg, c.toggleColor,
          )}
          whileHover={{ scale: 1.08 }}
          whileTap={{ scale: 0.92 }}
          aria-label="Toggle login theme"
        >
          <AnimatePresence mode="wait" initial={false}>
            <motion.div
              key={loginTheme}
              initial={{ rotate: -90, opacity: 0 }}
              animate={{ rotate: 0, opacity: 1 }}
              exit={{ rotate: 90, opacity: 0 }}
              transition={{ duration: 0.2 }}
            >
              {isDark ? <Sun size={17} /> : <Moon size={17} />}
            </motion.div>
          </AnimatePresence>
        </motion.button>

        {/* ===== LEFT: Branding — desktop only ===== */}
        <motion.div
          className="hidden lg:flex lg:w-[48%] xl:w-[45%] flex-col justify-between p-12"
          initial={{ opacity: 0, x: -30 }}
          animate={{ opacity: 1, x: 0 }}
          transition={{ delay: 0.2, duration: 0.7 }}
        >
          {/* Logo */}
          <div className="flex items-center gap-3">
            <TyroLogo size={44} variant="login" themeColors={isDark ? undefined : AURORA_LOGO_COLORS} />
            <span className={cn("text-[26px] font-extrabold tracking-tight transition-colors duration-500", c.logoText)}>
              tyro<span className={cn("transition-all duration-500", c.logoAccent)}>strategy</span>
            </span>
          </div>

          {/* Headline + Description */}
          <div>
            <motion.h1
              className={cn("text-[46px] font-extrabold leading-[1.12] tracking-tight mb-5 transition-colors duration-500", c.text)}
              initial={{ opacity: 0, y: 30 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.4, duration: 0.8, ease: "easeOut" }}
            >
              {t("login.strategicManagement")}
              <br />
              <span className={cn("transition-all duration-500", c.headline)}>
                {t("login.platform")}
              </span>
            </motion.h1>
            <motion.p
              className={cn("text-[18px] leading-relaxed max-w-[440px] transition-colors duration-500", c.textSub)}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.6, duration: 0.6 }}
            >
              {t("login.heroDescription")}
            </motion.p>
          </div>

          {/* Features + Footer */}
          <div className="relative">
            {/* Liquid drop blob — features area */}
            <motion.div
              className="absolute -top-6 -left-6 w-28 h-28 rounded-full opacity-20 blur-2xl pointer-events-none"
              style={{ background: isDark ? "radial-gradient(circle, #3b6ba5 0%, transparent 70%)" : "radial-gradient(circle, #34d399 0%, transparent 70%)" }}
              animate={{ x: [0, 8, -6, 0], y: [0, -6, 8, 0], scale: [1, 1.1, 0.95, 1] }}
              transition={{ duration: 9, repeat: Infinity, ease: "easeInOut" }}
            />

            <div className="flex flex-col gap-2.5 mb-5">
              {features.map((f, i) => {
                const isActive = i === featureIndex;
                return (
                  <motion.div
                    key={f.title}
                    className={cn(
                      "flex items-center gap-3.5 rounded-xl px-4 py-3 transition-all duration-500 border",
                      isActive
                        ? c.featureActiveBg
                        : "border-transparent",
                    )}
                    initial={{ opacity: 0, x: -20 }}
                    animate={{ opacity: 1, x: 0 }}
                    transition={{ delay: 0.5 + i * 0.08, duration: 0.5 }}
                    layout
                  >
                    <div
                      className={cn(
                        "w-10 h-10 rounded-xl flex items-center justify-center shrink-0 transition-all duration-500",
                        isActive ? c.featureIconActive : c.featureIconPassive,
                      )}
                    >
                      <f.icon
                        size={18}
                        className={cn(
                          "transition-all duration-500",
                          isActive ? c.featureIconColor : c.textMuted,
                        )}
                      />
                    </div>
                    <div className="overflow-hidden">
                      <h4
                        className={cn(
                          "text-[13px] font-semibold transition-colors duration-500",
                          isActive ? c.text : c.textSub,
                        )}
                      >
                        {f.title}
                      </h4>
                      <AnimatePresence>
                        {isActive && (
                          <motion.p
                            className={cn("text-[11px] leading-snug", c.textMuted)}
                            initial={{ height: 0, opacity: 0 }}
                            animate={{ height: "auto", opacity: 1 }}
                            exit={{ height: 0, opacity: 0 }}
                            transition={{ duration: 0.3 }}
                          >
                            {f.desc}
                          </motion.p>
                        )}
                      </AnimatePresence>
                    </div>

                    {/* Active indicator dot */}
                    {isActive && (
                      <motion.div
                        className="ml-auto w-1.5 h-1.5 rounded-full shrink-0"
                        style={{ background: isDark ? "linear-gradient(135deg, #e0ad3e, #3b6ba5)" : "linear-gradient(135deg, #34d399, #6366f1)" }}
                        layoutId="feature-dot"
                        transition={{ type: "spring", stiffness: 300, damping: 25 }}
                      />
                    )}
                  </motion.div>
                );
              })}
            </div>

            {/* Desktop copyright — glassmorphism bar */}
            <div
              className={cn("pt-4 mt-2 border-t transition-colors duration-300", c.borderT)}
            >
              <p className={cn("text-[11px] transition-colors duration-300", c.copyright)}>{COPYRIGHT}</p>
            </div>
          </div>
        </motion.div>

        {/* ===== RIGHT: Login card area ===== */}
        <div className="flex-1 flex items-center justify-center px-5 py-8 sm:p-12">
          <motion.div
            className="w-full max-w-[520px] lg:max-w-[500px]"
            initial={{ opacity: 0, y: 20, scale: 0.96 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            transition={{ delay: 0.3, duration: 0.5 }}
          >
            {/* Mobile logo */}
            <motion.div
              className="flex lg:hidden items-center justify-center gap-3 mb-8"
              initial={{ opacity: 0, y: -10 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.15, duration: 0.5 }}
            >
              <TyroLogo size={36} variant="sidebar" isDark={isDark} themeColors={isDark ? undefined : AURORA_LOGO_COLORS} />
              <span className={cn("text-[22px] font-extrabold tracking-tight transition-colors duration-500", c.logoText)}>
                tyro<span className={cn("transition-all duration-500", c.logoAccent)}>strategy</span>
              </span>
            </motion.div>

            {/* ===== ANIMATED BORDER + GLASS CARD ===== */}
            <div
              className="rounded-2xl p-[2px] transition-all duration-700"
              style={{
                background: c.cardBorder,
                animation: "login-border-rotate 8s linear infinite",
                boxShadow: isDark
                  ? "0 25px 60px rgba(0,0,0,0.35), 0 8px 30px rgba(59,107,165,0.15)"
                  : "0 8px 40px rgba(147,197,253,0.15), 0 4px 20px rgba(167,139,250,0.08)",
              }}
            >
              <div
                className="rounded-2xl p-8 sm:p-12 relative overflow-hidden"
                style={{
                  background: c.cardBg,
                  backdropFilter: "blur(24px) saturate(1.4)",
                  WebkitBackdropFilter: "blur(24px) saturate(1.4)",
                }}
              >
                {/* ── Mini aurora light waves inside card ── */}
                <div
                  className="pointer-events-none absolute inset-0 [background-size:300%,200%] [animation:aurora_60s_linear_infinite]"
                  style={{
                    backgroundImage: isDark
                      ? "repeating-linear-gradient(100deg, rgba(59,107,165,0) 0%, rgba(59,107,165,0) 6%, rgba(59,107,165,0.08) 9%, rgba(224,173,62,0.05) 12%, rgba(59,107,165,0) 16%, rgba(90,142,196,0.06) 20%, rgba(59,107,165,0) 25%),repeating-linear-gradient(100deg, rgba(59,107,165,0) 0%, rgba(224,173,62,0.04) 8%, rgba(59,107,165,0) 15%, rgba(90,142,196,0.06) 22%, rgba(59,107,165,0) 30%)"
                      : "repeating-linear-gradient(100deg, rgba(255,255,255,0) 0%, rgba(255,255,255,0) 6%, rgba(190,200,255,0.07) 9%, rgba(170,185,255,0.05) 12%, rgba(255,255,255,0) 16%, rgba(210,200,255,0.06) 20%, rgba(255,255,255,0) 25%),repeating-linear-gradient(100deg, rgba(255,255,255,0) 0%, rgba(200,195,255,0.05) 8%, rgba(255,255,255,0) 15%, rgba(185,195,255,0.06) 22%, rgba(255,255,255,0) 30%)",
                    filter: "blur(16px)",
                  }}
                />

                <div className="relative z-10">
                  {/* ── Language toggle — top right pill ── */}
                  <div className="flex justify-end mb-6">
                    <div className={cn("inline-flex items-center gap-0.5 p-1 rounded-full backdrop-blur-sm border transition-colors duration-500", c.cardLangBg)}>
                      <button
                        type="button"
                        onClick={() => setLocale("tr")}
                        className={cn(
                          "text-[11px] font-bold px-3 py-1.5 rounded-full transition-all duration-300 cursor-pointer",
                          locale === "tr" ? c.cardLangActive : c.cardLangInactive,
                        )}
                      >
                        TR
                      </button>
                      <button
                        type="button"
                        onClick={() => setLocale("en")}
                        className={cn(
                          "text-[11px] font-bold px-3 py-1.5 rounded-full transition-all duration-300 cursor-pointer",
                          locale === "en" ? c.cardLangActive : c.cardLangInactive,
                        )}
                      >
                        EN
                      </button>
                    </div>
                  </div>

                  {/* ── Header section ── */}
                  <div className="text-center mb-8">
                    <motion.div
                      className={cn("inline-flex items-center justify-center w-14 h-14 rounded-2xl mb-4 border transition-colors duration-500", c.cardShieldBorder)}
                      style={{ background: c.cardShieldBg }}
                      initial={{ scale: 0, rotate: -20 }}
                      animate={{ scale: 1, rotate: 0 }}
                      transition={{ delay: 0.4, type: "spring", stiffness: 200 }}
                    >
                      <Shield size={24} className={cn("transition-colors duration-500", c.cardShieldColor)} />
                    </motion.div>
                    <h2 className={cn("text-[24px] sm:text-[28px] font-extrabold tracking-tight mb-2 transition-colors duration-500", c.cardHeading)}>
                      {t("login.welcome")}
                    </h2>
                    <p className={cn("text-[14px] sm:text-[15px] leading-relaxed max-w-[320px] mx-auto transition-colors duration-500", c.cardSubtitle)}>
                      {t("login.ssoSubtitle")}
                    </p>
                  </div>

                  {/* ── Divider ── */}
                  <div className="flex items-center gap-3 mb-6">
                    <div className="flex-1 h-px transition-colors duration-500" style={{ background: `linear-gradient(to right, transparent, ${c.cardDividerColor}40, transparent)` }} />
                    <span className={cn("text-[10px] font-semibold uppercase tracking-widest transition-colors duration-500", c.cardInfoText)}>SSO</span>
                    <div className="flex-1 h-px transition-colors duration-500" style={{ background: `linear-gradient(to right, transparent, ${c.cardDividerColor}40, transparent)` }} />
                  </div>

                  {/* ── Microsoft login button ── */}
                  <motion.div
                    whileHover={{ scale: 1.015, y: -1 }}
                    whileTap={{ scale: 0.985 }}
                    transition={{ type: "spring", stiffness: 400, damping: 17 }}
                  >
                    <Button
                      size="lg"
                      className="w-full h-[52px] sm:h-[56px] text-[14px] sm:text-[15px] font-semibold rounded-xl border-0 text-white"
                      isLoading={msalLoading}
                      onPress={msalLogin}
                      startContent={!msalLoading ? <MicrosoftIcon /> : undefined}
                      style={{
                        background: "linear-gradient(135deg, #0078d4 0%, #005a9e 50%, #004578 100%)",
                        boxShadow: "0 6px 24px rgba(0,120,212,0.3), 0 2px 8px rgba(0,90,158,0.2)",
                      }}
                    >
                      {t("login.microsoftLogin")}
                    </Button>
                  </motion.div>

                  {/* ── MSAL error ── */}
                  {msalError && (
                    <motion.div
                      initial={{ opacity: 0, y: -4 }}
                      animate={{ opacity: 1, y: 0 }}
                      className={cn(
                        "mt-4 flex items-start gap-2.5 p-3.5 rounded-xl backdrop-blur-sm border",
                        isDark ? "bg-red-500/10 border-red-400/20" : "bg-red-50/80 border-red-100/60",
                      )}
                    >
                      <Shield size={14} className={cn("mt-0.5 shrink-0", isDark ? "text-red-300" : "text-red-400")} />
                      <p className={cn("text-[11px] leading-relaxed", isDark ? "text-red-200" : "text-red-600")}>{msalError}</p>
                    </motion.div>
                  )}

                  {/* ── Info box — glassmorphism ── */}
                  <div
                    className={cn("flex items-center justify-center gap-2.5 mt-5 px-4 py-3 rounded-xl border transition-colors duration-500", c.cardInfoBorder)}
                    style={{
                      background: c.cardInfoBg,
                      backdropFilter: "blur(12px)",
                      WebkitBackdropFilter: "blur(12px)",
                    }}
                  >
                    <div className={cn("w-6 h-6 rounded-md flex items-center justify-center shrink-0 transition-colors duration-500", c.cardInfoIcon)}>
                      <Shield size={12} className={cn("transition-colors duration-500", c.cardInfoIconColor)} />
                    </div>
                    <p className={cn("text-[12px] font-medium transition-colors duration-500", c.cardInfoText)}>
                      {t("login.ssoInfo")}
                    </p>
                  </div>
                </div>
              </div>
            </div>

            {/* Mobile features */}
            <div className="flex lg:hidden justify-center gap-5 mt-7">
              {features.map((f) => (
                <div key={f.title} className="flex flex-col items-center gap-1.5">
                  <div className={cn("w-10 h-10 rounded-xl flex items-center justify-center transition-all duration-300", c.mobileFeatureIconBg)}>
                    <f.icon size={16} className={cn("transition-colors duration-300", c.featureIconColor)} />
                  </div>
                  <span className={cn("text-[11px] font-medium text-center leading-tight max-w-[64px] transition-colors duration-300", c.mobileFeatureText)}>
                    {f.title}
                  </span>
                </div>
              ))}
            </div>

            {/* Mobile copyright */}
            <p className={cn("lg:hidden text-center text-[11px] sm:text-xs mt-6 transition-colors duration-300", c.copyright)}>
              {COPYRIGHT}
            </p>
          </motion.div>
        </div>
      </motion.div>
    </AuroraBackground>
  );
}
