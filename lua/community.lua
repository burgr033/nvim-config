---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- colorscheme
  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  -- completion
  { import = "astrocommunity.completion.blink-cmp" },
  -- diagnostics
  { import = "astrocommunity.diagnostics.tiny-inline-diagnostic-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- editing support
  { import = "astrocommunity.editing-support.neogen" },
  -- file explorer
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.snippet.mini-snippets" },
  -- lsp
  -- {
  --   import = "astrocommunity.lsp.nvim-java",
  --   enabled = require("settings").Desktop(),
  -- },
  -- motion
  { import = "astrocommunity.motion.nvim-surround" },
  -- packs
  { import = "astrocommunity.pack.go", enabled = require("settings").Desktop() },
  { import = "astrocommunity.pack.ansible", enabled = require("settings").Server() },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.toml" },
  -- recipes
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  -- test
  { import = "astrocommunity.test.neotest", enabled = require("settings").Desktop() },
}
