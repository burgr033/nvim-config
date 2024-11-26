---@type LazySpec
return {
  {
    "FerretDetective/oil-git-signs.nvim",
    ft = "oil",
    opts = {},
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    lazy = true,
    opts = {
      require("dap-go").setup {
        delve = {
          detached = false,
        },
      },
    },
  },
  {
    "burgr033/mf-runner.nvim",
    cmd = { "MFROpen", "MFRRun", "MFREdit" },
    dependencies = { "nvim-telescope/telescope.nvim", "akinsho/toggleterm.nvim" },
    opts = {},
  },
  {
    "icewind/ltex-client.nvim",
    ft = { "tex", "bib" },
    config = function()
      vim.g.tex_flavor = "latex"
      vim.opt.wrap = true
      require("ltex-client").setup {}
    end,
  },
  {
    "kosayoda/nvim-lightbulb",
    event = "LspAttach",

    opts = {},
  },
  {
    "natecraddock/workspaces.nvim",
    cmd = { "WorkspacesAdd", "WorkspacesList", "WorkspacesOpen" },
    config = function()
      require("workspaces").setup {
        hooks = {
          open = { "Oil" },
        },
      }
      local telescope = require "telescope"
      local utils = require "astrocore"
      utils.conditional_func(telescope.load_extension, utils.is_available "workspaces.nvim", "workspaces")
    end,
  },
}
