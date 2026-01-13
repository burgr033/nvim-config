return {
  { "danymat/neogen", config = function() require("neogen").setup { snippet_engine = "nvim" } end },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      run_on_start = false,
    },
  },
  {
    "Saghen/blink.cmp",
    opts = {
      sources = { default = { "lsp", "path", "snippets" } },
      snippets = { preset = "default" },
    },
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      quickfile = {},
      bigfile = {},
      statuscolumn = {},
      dashboard = {
        preset = {
          header = [[
██████████████████████████████████████████████████████████████████████████
██                                                                      ██
██  IF YOU WANT IMMEDIATE FEEDBACK, ALWAYS MAKE CHANGES IN PRODUCTION.  ██
██                                                                      ██
██████████████████████████████████████████████████████████████████████████
          ]],
        },
      },
    },
    keys = {
      { "<leader>bS", function() require("snacks").scratch() end, desc = "Open Scratch" },
    },
  },
}
