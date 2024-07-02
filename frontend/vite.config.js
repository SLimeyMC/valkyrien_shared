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
      "@assets": path.resolve(__dirname, "./assets"),
    },
  },
  build: {
    sourcemap: true,
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