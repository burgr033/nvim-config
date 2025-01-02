---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- colorscheme
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  -- completion
  -- { import = "astrocommunity.completion.magazine-nvim" },
  { import = "astrocommunity.completion.blink-cmp" },
  -- diagnostics
  { import = "astrocommunity.diagnostics.tiny-inline-diagnostic-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- editing support
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  -- file explorer
  { import = "astrocommunity.file-explorer.oil-nvim" },
  -- lsp
  { import = "astrocommunity.lsp.nvim-java" },
  -- motion
  { import = "astrocommunity.motion.nvim-surround" },
  -- packs
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.lua" },
  -- recipes
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  -- test
  { import = "astrocommunity.test.neotest" },
}
