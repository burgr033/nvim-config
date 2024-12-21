---@type LazySpec
return {
  {
    "nvim-java/nvim-java",
    lazy = true,
    ft = "java",
    opts = {
      jdk = {
        auto_install = false,
      },
    },
  },
  { "danymat/neogen",         config = function() require("neogen").setup { snippet_engine = "luasnip" } end },
  { "neo-tree/neo-tree.nvim", enabled = false },
  {
    "stevearc/oil.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>e"] = { function() require("oil").toggle_float() end, desc = "Open folder in Oil" },
              ["<Leader>O"] = false,
            },
          },
        },
      },
    },
    config = function(_, opts) require("oil").setup(opts) end,
    opts = {
      view_options = {
        is_hidden_file = function(name, bufnr)
          if vim.startswith(name, "..") then return false end
          return vim.startswith(name, ".")
        end,
      },
      keymaps = {
        ["yy"] = {
          desc = "Copy name without symbol",
          require("oil.actions").copy_entry_filename,
        },
        ["yp"] = {
          desc = "Copy filepath to system clipboard",
          callback = function() require("oil.actions").copy_entry_path.callback() end,
        },
        ["<BS>"] = { require("oil.actions").parent, desc = "Navigate to the parent path" },
        ["<S-h>"] = { require("oil.actions").toggle_hidden, desc = "Toggle hidden files and directories" },
        ["<S-p>"] = {
          require("oil.actions").toggle_preview,
          desc = "Open the entry under the cursor in a preview window, or close the preview window if already open",
        },
      },
      columns = {
        "icon",
      },
      win_options = {
        signcolumn = "yes:2",
      },
    },
  },
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
      local get_icon = require("astroui").get_icon
      local button = require("alpha.themes.dashboard").button
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
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip" (plugin, opts)
      require("luasnip.loaders.from_snipmate").lazy_load {
        paths = { vim.fn.stdpath "config" .. "/snippets" },
      }
    end,
  },
}
