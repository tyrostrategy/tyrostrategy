// TYRO Strategy — service worker with offline fallback
//
// Cache version is derived from the `?v=<build-hash>` query string that
// main.tsx attaches at registration time. Each deploy gets a distinct
// bucket, so old bundles (3D assets, chunks) are evicted on activate.
const VERSION = new URL(self.location.href).searchParams.get("v") || "dev";
const CACHE_NAME = `tyro-${VERSION}`;
const OFFLINE_URL = "/offline.html";

// Pre-cache offline page on install
self.addEventListener("install", (e) => {
  e.waitUntil(
    caches.open(CACHE_NAME).then((cache) => cache.add(OFFLINE_URL))
  );
  self.skipWaiting();
});

// Clean old caches & claim clients
self.addEventListener("activate", (e) => {
  e.waitUntil(
    caches.keys().then((keys) =>
      Promise.all(keys.filter((k) => k !== CACHE_NAME).map((k) => caches.delete(k)))
    ).then(() => self.clients.claim())
  );
});

// Network-first with offline fallback
self.addEventListener("fetch", (e) => {
  if (e.request.method !== "GET" || !e.request.url.startsWith(self.location.origin)) return;

  // Navigation requests (HTML pages) — show offline.html if network fails
  if (e.request.mode === "navigate") {
    e.respondWith(
      fetch(e.request).catch(() => caches.match(OFFLINE_URL))
    );
    return;
  }

  // Other assets — network first, fall back to cache
  e.respondWith(
    fetch(e.request)
      .then((res) => {
        if (res.ok) {
          const clone = res.clone();
          caches.open(CACHE_NAME).then((cache) => cache.put(e.request, clone));
        }
        return res;
      })
      .catch(() => caches.match(e.request))
  );
});
