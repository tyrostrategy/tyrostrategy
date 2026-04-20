import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import tailwindcss from "@tailwindcss/vite";
import path from "path";
import { execSync } from "node:child_process";

// Build fingerprint — fed to the service worker as `?v=<hash>` so each
// deploy gets its own cache bucket (old bundles evict, new ones load
// fresh). Git hash when available, fallback to a base-36 timestamp so
// CI without git context still produces a unique value.
const BUILD_HASH = (() => {
  try {
    return execSync("git rev-parse --short HEAD", { stdio: ["ignore", "pipe", "ignore"] })
      .toString()
      .trim();
  } catch {
    return Date.now().toString(36);
  }
})();

const chunkMap: Record<string, string[]> = {
  "chunk-react": ["react", "react-dom", "react-router-dom", "react-is"],
  "chunk-ui": ["@heroui/react", "framer-motion", "lucide-react"],
  "chunk-charts": ["recharts"],
  "chunk-flow": ["@xyflow/react", "@dagrejs/dagre"],
  "chunk-gantt": ["wx-react-gantt"],
  "chunk-export": ["pptxgenjs", "docx", "exceljs", "jspdf", "html2canvas", "file-saver"],
  "chunk-editor": ["@tiptap/react", "@tiptap/starter-kit", "@tiptap/extension-placeholder", "@tiptap/extension-underline"],
  "chunk-azure": ["@azure/msal-browser", "@azure/msal-react"],
  "chunk-data": ["@tanstack/react-query", "@tanstack/react-table", "@supabase/supabase-js", "zustand"],
  "chunk-i18n": ["i18next", "react-i18next"],
};

export default defineConfig(({ mode }) => ({
  base: mode === "production" ? "./" : "/",
  plugins: [react(), tailwindcss()],
  define: {
    __BUILD_HASH__: JSON.stringify(BUILD_HASH),
  },
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
  build: {
    rollupOptions: {
      output: {
        manualChunks(id: string) {
          for (const [chunk, deps] of Object.entries(chunkMap)) {
            if (deps.some((dep) => id.includes(`node_modules/${dep}/`) || id.includes(`node_modules\\${dep}\\`))) {
              return chunk;
            }
          }
        },
      },
    },
  },
}));
