---@type LazySpec
return {
  -- { "AstroNvim/astrocore", version = false, branch = "v2" },
  -- { "AstroNvim/astrolsp", version = false, branch = "v3" },
  -- { "AstroNvim/astroui", version = false, branch = "v3" },
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
        ["."] = { "actions.cd", mode = "n" },
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
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      quickfile = {},
      -- scroll = {},
      -- words = {},
      -- TODO: PICKER.PROJECTS
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
      { "<leader>z", function() require("snacks").zen() end, desc = "Toggle Zen Mode" },
      { "<leader>bS", function() require("snacks").scratch() end, desc = "Open Scratch" },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { vim.fn.stdpath "config" .. "/snippets" },
      }
    end,
  },
}
