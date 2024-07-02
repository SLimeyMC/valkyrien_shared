import * as path from "node:path";
import { defineConfig } from "@farmfe/core";
import gleam from "vite-gleam";
import postCss from "@farmfe/js-plugin-postcss"

__dirname

export default defineConfig({
  compilation: {
    resolve: {
      alias: {
        "@": getRootPath(),
        "~": getSrcPath()
      },
    },
    sourcemap: true,
  },
  plugins: [postCss()],
  vitePlugins: [gleam()]
});


function getRootPath() {
  return path.resolve(process.cwd());
}

export function getSrcPath(srcName = 'src') {
  return path.resolve(process.cwd(), srcName);
}