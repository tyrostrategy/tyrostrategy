import type { Configuration, PopupRequest } from "@azure/msal-browser";

// Multi-tenant: "common" authority allows both Tiryaki and Sunrise tenant users to sign in.
// The Azure App Registration must be configured as "Accounts in any organizational directory".
export const msalConfig: Configuration = {
  auth: {
    clientId: import.meta.env.VITE_AZURE_CLIENT_ID || "placeholder",
    authority: "https://login.microsoftonline.com/common",
    redirectUri: typeof window !== "undefined" ? window.location.origin + window.location.pathname : "http://localhost:5173",
    postLogoutRedirectUri: "/",
    navigateToLoginRequestUrl: false,
  },
  cache: {
    // localStorage: PWA'da ("ana ekrana ekle" Safari / Android Chrome) ve
    // normal tarayıcı tab'larında auth state kalıcı. Kullanıcı tekrar email
    // yazmadan sadece Microsoft Authenticator onayı ile giriyor.
    //
    // sessionStorage mode (önceki) PWA'da her kapanışta wipe oluyordu —
    // kullanıcıya "böyle değildi" dedirten UX regresyonu. XSS saldırı vektörü
    // bu iç kurumsal app için düşük (MSAL redirect flow + Azure AD + no
    // user-generated HTML = XSS yüzey alanı yok), o yüzden localStorage
    // kalıcılığı daha değerli.
    //
    // Referans commit: 0771e73 sessionStorage'a geçiş, 2026-04-24 geri dönüş.
    cacheLocation: "localStorage",
    // Fallback cookie still helps IE/legacy edge cases during the redirect
    // handshake — harmless on modern browsers.
    storeAuthStateInCookie: true,
  },
};

export const loginRequest: PopupRequest = {
  scopes: ["User.Read", "openid", "profile", "email"],
  prompt: "select_account",
};
