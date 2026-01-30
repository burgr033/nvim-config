---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- color
  { import = "astrocommunity.colorscheme.gruvbox-baby" },

  -- completion
  { import = "astrocommunity.completion.blink-cmp" },

  -- runner
  { import = "astrocommunity.code-runner.mf-runner-nvim" },

  -- diagnostics
  { import = "astrocommunity.diagnostics.tiny-inline-diagnostic-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- docs
  { import = "astrocommunity.editing-support.neogen" },

  -- file
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
  { import = "astrocommunity.pack.markdown" },

  -- recipes
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },

  -- test
  { import = "astrocommunity.test.neotest" },
}
