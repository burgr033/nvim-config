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
  {
    "nvim-neorg/neorg",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Localleader>m"] = { false, desc = " metadata" },
              ["<Localleader>mu"] = { ":Neorg update-metadata<CR>", desc = "Update Metadata" },
              ["<Localleader>mi"] = { ":Neorg inject-metadata<CR>", desc = "Inject Metadata" },
              ["<Localleader>c"] = { false, desc = " code" },
              ["<Localleader>i"] = { false, desc = " insert" },
              ["<Localleader>l"] = { false, desc = " list / link" },
              ["<Localleader>lj"] = { "<Plug>(neorg.esupports.hop.hop-link.drop)<CR>", desc = " list / link" },
              ["<Localleader>r"] = { false, desc = "󰉫 rename" },
              ["<Localleader>rf"] = { ":Neorg lsp rename file<CR>", desc = "rename file" },
              ["<Localleader>rh"] = { ":Neorg lsp rename heading<CR>", desc = "rename heading" },
              ["<Localleader>n"] = { false, desc = " note" },
              ["<Localleader>ni"] = { ":Neorg index<CR>", desc = "Toggle Index" },
              ["<Localleader>t"] = { false, desc = " task" },
            },
          },
        },
      },
      { "juniorsundar/neorg-extras", ft = "norg", cmd = "Neorg" },
      { "benlubas/neorg-interim-ls", ft = "norg", cmd = "Neorg" },
      { "benlubas/neorg-conceal-wrap", ft = "norg", cmd = "Neorg" },
    },
    ft = "norg",
    cmd = "Neorg",
    build = ":Neorg sync-parsers",
    init = function()
      -- Set line wrapping and spell check for .norg files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "norg",
        callback = function()
          vim.wo.wrap = true
          vim.wo.linebreak = true
          vim.wo.breakindent = true
          vim.wo.conceallevel = 3
        end,
      })
      -- Set line wrapping and spell check for .norg files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "norg",
        callback = function()
          vim.wo.wrap = true
          vim.wo.linebreak = true
          vim.wo.breakindent = true
          vim.wo.conceallevel = 3
        end,
      })
    end,
    opts = {
      load = {
        ["core.summary"] = {},
        ["core.defaults"] = {},
        ["core.qol.toc"] = {
          config = {
            auto_toc = {
              open = true,
            },
          },
        },
        ["core.concealer"] = {},
        ["core.keybinds"] = { default_keybinds = false },
        ["core.esupports.metagen"] = {
          config = {
            author = "sb",
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.completion"] = {
          config = { engine = { module_name = "external.lsp-completion" } },
        },
        ["external.conceal-wrap"] = {},
        ["external.interim-ls"] = {
          config = {
            completion_provider = {
              enable = true,
              documentation = true,
              categories = false,
              people = {
                enable = false,
                path = "people",
              },
            },
          },
        },
      },
    },
  },
}
