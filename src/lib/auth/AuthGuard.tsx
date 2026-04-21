import type { ReactNode } from "react";
import { useEffect } from "react";
import { useIsAuthenticated, useMsal } from "@azure/msal-react";
import { InteractionStatus } from "@azure/msal-browser";
import { Navigate } from "react-router-dom";
import { useUIStore } from "@/stores/uiStore";
import { useDataStore } from "@/stores/dataStore";
import { applyUser } from "@/hooks/useMsalLogin";

export function AuthGuard({ children }: { children: ReactNode }) {
  const isAuthenticated = useIsAuthenticated();
  const { accounts, inProgress } = useMsal();
  const mockLoggedIn = useUIStore((s) => s.mockLoggedIn);
  const users = useDataStore((s) => s.users);

  // Re-apply the logged-in user from the FRESH users list on every
  // meaningful change:
  //   • page refresh (MSAL account persists, app state resets)
  //   • Supabase fetch completes after login and delivers newer rows
  //   • an admin changes this user's role in another browser and we
  //     refresh the data (role, display name, department, locale).
  //
  // Previously this effect early-returned when `mockLoggedIn` was true,
  // which meant once the app booted from a localStorage-cached session,
  // any DB-side change (role flip, etc.) was invisible until a full
  // logout + login — now applyUser re-runs idempotently whenever the
  // users array updates, so every refresh of the data propagates.
  useEffect(() => {
    if (!isAuthenticated || accounts.length === 0) return;
    if (inProgress !== InteractionStatus.None) return;
    if (users.length === 0) return; // Wait for DB users to load
    const email = accounts[0].username.toLowerCase().trim();
    const user = users.find((u) => u.email.toLowerCase() === email);
    if (user) {
      // applyUser also sets the Supabase session context (RLS) for us.
      // Safe to re-call — writes the same values if nothing changed.
      applyUser(user);
    }
  }, [isAuthenticated, accounts, users, inProgress]);

  // Wait for MSAL to finish initializing
  if (inProgress !== InteractionStatus.None) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-tyro-navy-dark via-tyro-navy to-tyro-navy-light">
        <div className="text-white/50 text-sm animate-pulse">Giriş yapılıyor…</div>
      </div>
    );
  }

  // Not authenticated → login page
  if (!isAuthenticated && !mockLoggedIn) return <Navigate to="/login" replace />;

  // Authenticated but user not yet resolved from DB
  if (isAuthenticated && !mockLoggedIn) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-tyro-navy-dark via-tyro-navy to-tyro-navy-light">
        <div className="text-white/50 text-sm animate-pulse">Giriş yapılıyor…</div>
      </div>
    );
  }

  return <>{children}</>;
}
