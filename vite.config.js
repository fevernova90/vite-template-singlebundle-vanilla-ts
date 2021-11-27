import { defineConfig } from "vite";

export default defineConfig({
  plugins: [],
  server: {
    port: 8080,
    // host: true,
    // origin: "https://your-dev-proxy",
    // hmr: {
    //   clientPort: 443,
    // },
  },
  build: {
    lib: {
      entry: "src/main.ts",
      formats: ["iife"],
      fileName: "app",
      name: "app",
    },
    cssCodeSplit: true,
  },
});
