import * as path from "node:path";
import { defineConfig } from "vite";
import gleam from "vite-gleam";
import postcssLightningcss from "postcss-lightningcss";
import postcssShort from "postcss-short";
import postcssCompactMq from "postcss-compact-mq"
import postcssDefineProperty from "postcss-define-property"

export default defineConfig({
  resolve: {
    alias: {
      "~": process.cwd(),
      "@": path.resolve(process.cwd(), "src"),
      "@assets": path.resolve(process.cwd(), "src", "assets"),
    },
  },
  plugins: [gleam()],
  css: {
      transformer: "postcss",
      postcss: [
        postcssDefineProperty(),
        postcssShort(),
        postcssCompactMq(),
        postcssLightningcss({drafts: { nesting: true, customMedia: true }}),
      ]
    },
});
