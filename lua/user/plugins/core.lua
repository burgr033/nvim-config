return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    dependencies = { "cigh033/alpha-nvim-bofh-excuse" },
    opts = function(_, opts)
      -- customize the dashboard header
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
  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/user/snippets" } } -- load snippets paths
      require("luasnip.loaders.from_snipmate").lazy_load { paths = { "./lua/user/snippets" } }
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
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require "cmp"
      cmp.setup {
        mapping = cmp.mapping.preset.insert {
          ["<C-l>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        },
      }
    end,
  },
}
