---@type LazySpec
return {
  {
    "burgr033/mf-runner.nvim",
    cmd = { "MFROpen", "MFRRun", "MFREdit" },
    dependencies = {
      "folke/snacks.nvim",
    },
    opts = {},
  },
  {
    "burgr033/presenterm.nvim",
    ft = "markdown",
    opts = {},
  },
  {
    "nvim-java/nvim-java",
    enabled = require("settings").Desktop(),
    lazy = true,
    ft = "java",
    opts = {
      jdk = {
        auto_install = false,
      },
    },
  },
  { "danymat/neogen", config = function() require("neogen").setup { snippet_engine = "nvim" } end },
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
      scroll = {},
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
