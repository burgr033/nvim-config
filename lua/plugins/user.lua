---@type LazySpec
return {
  {
    "refractalize/oil-git-status.nvim",
    ft = "oil",
    dependencies = {
      "stevearc/oil.nvim",
    },
    config = true,
  },
  {
    "burgr033/mf-runner.nvim",
    cmd = { "MFROpen", "MFRRun", "MFREdit" },
    dependencies = {
      "folke/snacks.nvim",
    },
    opts = {},
  },
  {
    "icewind/ltex-client.nvim",
    enabled = require("settings").Desktop(),
    ft = { "tex", "bib" },
    config = function()
      vim.g.tex_flavor = "latex"
      vim.opt.wrap = true
      require("ltex-client").setup()
    end,
  },
}
