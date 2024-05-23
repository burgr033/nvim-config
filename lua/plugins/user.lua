---@type LazySpec
return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    event = "User Astrofile",
    config = function()
      vim.keymap.set("n", "<Leader>Nn", require("no-neck-pain").toggle, { desc = "Toggle No Neck Pain" })
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = "User AstroFile",
    config = function()
      vim.g.codeium_no_map_tab = true
      vim.g.codeium_disable_bindings = true
      vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("n", "<Leader>;", function()
        if vim.g.codeium_enabled == true then
          vim.cmd "CodeiumDisable"
        else
          vim.cmd "CodeiumEnable"
        end
      end, { noremap = true, desc = "Toggle Codeium" })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  { "zbirenbaum/copilot-cmp", opts = {}, dependencies = { "zbirenbaum/copilot.lua" } },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot-cmp" },
    opts = function(_, opts)
      -- Inject copilot into cmp sources, with high priority
      table.insert(opts.sources, 1, {
        name = "copilot",
        group_index = 1,
        priority = 10000,
      })
    end,
  },
  {
    "onsails/lspkind.nvim",
    optional = true,
    -- Adds icon for copilot using lspkind
    opts = function(_, opts) opts.symbol_map.Copilot = "" end,
  },

  {
    "burgr033/mf-runner.nvim",
    cmd = { "MFROpen", "MFRRun", "MFREdit" },
    dependencies = { "nvim-telescope/telescope.nvim", "akinsho/toggleterm.nvim" },
    opts = {},
  },
  {
    "lervag/vimtex",
    dependencies = { "hrsh7th/cmp-omni" },
    ft = { "tex", "bib" },
    opts = { patterns = { "*.tex" } },
    config = function(_, opts)
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = opts.patterns,
        callback = function() vim.cmd [[VimtexCompile]] end,
      })
      vim.g.vimtex_quickfix_ignore_filters =
        { "Package typearea Warning", "MakeUppercase", "MT@gobble@to@nil", "Runaway argument?" }
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "out",
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-interaction=nonstopmode",
          "-synctex=1",
        },
      }
      if vim.fn.has "win32" == 1 then
        vim.g.vimtex_view_general_viewer = "SumatraPDF"
        vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
      end
      if vim.fn.has "linux" == 1 then vim.g.vimtex_view_method = "zathura" end
      vim.g.vimtex_fold_enabled = true
      vim.g.vimtex_syntax_conceal = {
        accents = 1,
        ligatures = 1,
        cites = 1,
        fancy = 1,
        spacing = 0, -- default: 1
        greek = 1,
        math_bounds = 1,
        math_delimiters = 1,
        math_fracs = 1,
        math_super_sub = 1,
        math_symbols = 1,
        sections = 0,
        styles = 1,
      }
    end,
  },
  {
    "icewind/ltex-client.nvim",
    ft = { "tex", "bib" },
    config = function()
      require("ltex-client").setup()
      require("lspconfig").ltex.setup {
        settings = {
          ltex = {
            language = "de-DE",
          },
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local telescope = require "telescope"
      local utils = require "astrocore"
      utils.conditional_func(telescope.load_extension, utils.is_available "workspaces.nvim", "workspaces")
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
          open = { "Neotree toggle" },
        },
      }
    end,
  },
}
