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
    "burgr033/presenterm.nvim",
    ft = "markdown",
    opts = {},
  },
}
