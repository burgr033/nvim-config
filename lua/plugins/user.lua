local success, config = pcall(require, "machine_override")
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
