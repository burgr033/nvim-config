return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
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
        button("LDR W  ", get_icon("FolderOpen", 2, true) .. "Workspaces  "),
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
  },
  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip" (plugin, opts)                                       -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/user/snippets" } } -- load snippets paths
      require("luasnip.loaders.from_snipmate").lazy_load { paths = { "./lua/user/snippets" } }
    end,
  },
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup {
        mode = "toggleterm",
        before_run_filetype = function() vim.cmd ":w" end,
        filetype = {
          ps1 = {
            "cd $dir && powershell -file $fileName",
          },
          rust = {
            "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
          },
        },
      }
    end,
  },
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require("workspaces").setup {
        hooks = {
          open = { "Neotree toggle" },
        },
      }
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
  --
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  -- {
  --   "folke/which-key.nvim",
  --   config = function(plugin, opts)
  --     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- Add bindings which show up as group name
  --     local wk = require "which-key"
  --     wk.register({
  --       b = { name = "Buffer" },
  --     }, { mode = "n", prefix = "<leader>" })
  --   end,
  -- },
}
