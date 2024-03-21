return {
  {
    "goolord/alpha-nvim",
    dependencies = { "burgr033/alpha-nvim-bofh-excuse" },
    opts = function(_, opts)
      opts.section.header.val = {
        "██████████████████████████████████████████████████████████████████████████",
        "██                                                                      ██",
        "██  IF YOU WANT IMMEDIATE FEEDBACK, ALWAYS MAKE CHANGES IN PRODUCTION.  ██",
        "██                                                                      ██",
        "██████████████████████████████████████████████████████████████████████████",
      }
      opts.section.header.opts.hl = "DashboardHeader"
      local button = require("astronvim.utils").alpha_button
      local get_icon = require("astronvim.utils").get_icon
      opts.section.buttons.val = {
        button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
        button("LDR W o", get_icon("FolderOpen", 2, true) .. "Workspaces  "),
        button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
        button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
        button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
        button("LDR S l", get_icon("Refresh", 2, true) .. "Last Session  "),
      }
      opts.section.header.opts.hl = "DashboardFooter"
      local excuse = require "alpha.excuse"
      opts.section.footer.val = excuse()
      opts.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
      opts.config.layout[3].val = 5
      opts.config.opts.noautocmd = true
      return opts
    end,
    config = function(_, opts) require("alpha").setup(opts.config) end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip" (plugin, opts)
      require("luasnip.loaders.from_snipmate").lazy_load { paths = { "./lua/user/snippets" } }
      require "user."
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local telescope = require "telescope"
      local utils = require "astronvim.utils"
      utils.conditional_func(telescope.load_extension, utils.is_available "workspaces.nvim", "workspaces")
    end,
  },
}
