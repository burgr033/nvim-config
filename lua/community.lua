---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.colorscheme.gruvbox-baby" },

  { import = "astrocommunity.completion.blink-cmp" },

  -- diagnostics
  { import = "astrocommunity.diagnostics.tiny-inline-diagnostic-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- docs
  { import = "astrocommunity.editing-support.neogen" },

  { import = "astrocommunity.file-explorer.oil-nvim" },

  -- rendering
  {
    import = "astrocommunity.markdown-and-latex.render-markdown-nvim",
  },

  -- motions
  { import = "astrocommunity.motion.nvim-surround" },

  -- packs
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.toml" },

  -- recipes
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  -- test
  { import = "astrocommunity.test.neotest" },
}
