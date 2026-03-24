/**
 * Universal search helper — Türkçe locale-aware, null-safe.
 * Tüm sayfalarda tutarlı arama için tek fonksiyon.
 */
export function matchesSearch(
  query: string,
  ...fields: (string | number | undefined | null)[]
): boolean {
  if (!query.trim()) return true;
  const q = query.toLocaleLowerCase("tr");
  const combined = fields
    .filter((f) => f != null)
    .map(String)
    .join(" ")
    .toLocaleLowerCase("tr");
  return combined.includes(q);
}

/** Format date helper for search (dd.mm.yyyy) */
export function formatDateForSearch(dateStr?: string | null): string {
  if (!dateStr) return "";
  try {
    const d = new Date(dateStr);
    if (isNaN(d.getTime())) return dateStr;
    return d.toLocaleDateString("tr-TR", {
      day: "2-digit",
      month: "2-digit",
      year: "numeric",
    });
  } catch {
    return dateStr;
  }
}
