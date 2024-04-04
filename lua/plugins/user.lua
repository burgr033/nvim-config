---@type LazySpec
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
      -- local button = require "astroui".alpha
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
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      require("luasnip.loaders.from_snipmate").lazy_load { paths = { "./lua/user/snippets" } }
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
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
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
