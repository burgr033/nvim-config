---@type LazySpec
return {
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
    "refractalize/oil-git-status.nvim",
    ft = "oil",
    dependencies = {
      "stevearc/oil.nvim",
    },
    opts = {},
  },
}
