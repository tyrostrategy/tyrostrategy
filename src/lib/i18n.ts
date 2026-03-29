import i18n from "i18next";
import { initReactI18next } from "react-i18next";
import tr from "@/locales/tr.json";
import en from "@/locales/en.json";

const savedLocale = localStorage.getItem("tyro-locale") || "tr";

i18n.use(initReactI18next).init({
  resources: {
    tr: { translation: tr },
    en: { translation: en },
  },
  lng: savedLocale,
  fallbackLng: "tr",
  interpolation: { escapeValue: false },

  // Dev-time: log missing translation keys to console
  ...(import.meta.env.DEV && {
    saveMissing: true,
    missingKeyHandler: (_lngs: readonly string[], ns: string, key: string) => {
      console.warn(`[i18n] Missing key: "${ns}:${key}"`);
    },
  }),
});

// Sync document lang with i18n — CSS text-transform:uppercase uses this
// Without it, Turkish OS uppercases "i" → "İ" even in English mode
if (typeof document !== "undefined") {
  document.documentElement.lang = savedLocale;
  i18n.on("languageChanged", (lng) => {
    document.documentElement.lang = lng;
  });
}

export default i18n;
