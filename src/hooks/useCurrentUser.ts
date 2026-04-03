import { useUIStore } from "@/stores/uiStore";
import { useDataStore } from "@/stores/dataStore";
import { departments } from "@/config/departments";
import type { UserRole } from "@/types";

interface CurrentUser {
  name: string;
  email: string;
  department: string;
  title: string;
  initials: string;
  role: UserRole;
}

function getInitials(name: string): string {
  return name
    .split(" ")
    .map((n) => n[0])
    .join("")
    .toUpperCase()
    .slice(0, 2);
}

/** Fallback: search hardcoded departments config */
function findInDepts(userName: string): { email: string; department: string; title: string } {
  const normalized = userName.toLowerCase().trim();
  for (const dept of departments) {
    const user = dept.users.find((u) => u.name.toLowerCase().trim() === normalized);
    if (user) return { email: user.email, department: dept.name, title: user.title };
  }
  return { email: "", department: "Bilinmiyor", title: "" };
}

export function useCurrentUser(): CurrentUser {
  const mockUserName = useUIStore((s) => s.mockUserName);
  const mockUserRole = useUIStore((s) => s.mockUserRole) as UserRole;
  const dbUsers = useDataStore((s) => s.users);

  const name = mockUserName;
  const initials = getInitials(name);

  const validRoles: UserRole[] = ["Admin", "Proje Lideri", "Kullanıcı", "Management"];
  const role: UserRole = validRoles.includes(mockUserRole) ? mockUserRole : "Kullanıcı";

  // Try DB users first, fallback to hardcoded departments
  const dbUser = dbUsers.find((u) => u.displayName.toLowerCase().trim() === name.toLowerCase().trim());
  if (dbUser) {
    return {
      name,
      email: dbUser.email,
      department: dbUser.department || "Bilinmiyor",
      title: dbUser.title ?? "",
      initials,
      role,
    };
  }

  const fallback = findInDepts(name);
  return { name, email: fallback.email, department: fallback.department, title: fallback.title, initials, role };
}
