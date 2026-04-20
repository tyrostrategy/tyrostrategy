import "@/lib/i18n";
import { StrictMode, type ReactNode } from "react";

// Build fingerprint injected by vite.config.ts define — appended to the
// service worker registration URL so each deploy gets its own cache.
declare const __BUILD_HASH__: string;
import { createRoot } from "react-dom/client";
import { PublicClientApplication, EventType } from "@azure/msal-browser";
import type { AuthenticationResult } from "@azure/msal-browser";
import { MsalProvider } from "@azure/msal-react";
import { HeroUIProvider } from "@heroui/react";
import { useUIStore } from "@/stores/uiStore";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { msalConfig } from "@/lib/auth/msalConfig";
import App from "./App";
import "./styles/globals.css";

// Global error handlers — prevent silent failures
window.addEventListener("unhandledrejection", (event) => {
  console.error("[Unhandled Promise Rejection]", event.reason);
});

window.addEventListener("error", (event) => {
  console.error("[Global Error]", event.error);
});

// Apply saved theme before render to prevent flash
const savedTheme = localStorage.getItem("tyro-theme");
if (savedTheme === "dark") {
  document.documentElement.classList.add("dark");
}

// MSAL instance OUTSIDE component tree
const hasRealAuth = !!import.meta.env.VITE_AZURE_CLIENT_ID;
const msalInstance = new PublicClientApplication(msalConfig);

if (hasRealAuth) {
  msalInstance.addEventCallback((event) => {
    if (
      event.eventType === EventType.LOGIN_SUCCESS &&
      (event.payload as AuthenticationResult)?.account
    ) {
      msalInstance.setActiveAccount(
        (event.payload as AuthenticationResult).account
      );
    }
  });

  msalInstance.initialize().then(() => {
    msalInstance
      .handleRedirectPromise()
      .then((response) => {
        if (response?.account) {
          msalInstance.setActiveAccount(response.account);
        }
      })
      .catch((err) => {
        console.error("[MSAL] handleRedirectPromise failed:", err);
      });
  });
}

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 5 * 60 * 1000,
      gcTime: 10 * 60 * 1000,
      retry: 1,
    },
  },
});

function LocaleAwareHeroUI({ children }: { children: ReactNode }) {
  const locale = useUIStore((s) => s.locale);
  return <HeroUIProvider locale={locale === "tr" ? "tr-TR" : "en-US"}>{children}</HeroUIProvider>;
}

// Register service worker for PWA. Version query ensures a new build
// installs a new SW (different registration URL → forced re-install
// → activate event evicts the previous cache).
if ("serviceWorker" in navigator) {
  window.addEventListener("load", () => {
    navigator.serviceWorker.register(`/sw.js?v=${__BUILD_HASH__}`).catch(() => {});
  });
}

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <MsalProvider instance={msalInstance}>
      <QueryClientProvider client={queryClient}>
        <LocaleAwareHeroUI>
          <App />
        </LocaleAwareHeroUI>
      </QueryClientProvider>
    </MsalProvider>
  </StrictMode>
);
