return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "dgagn/diagflow.nvim",
    event = "BufWinEnter",
    opts = {
      show_borders = true,
      scope = "line",
    },
  },
  {
    "mfussenegger/nvim-dap",
    enabled = false,
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
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "User AstroFile",
    config = true,
  },
  {
    "CRAG666/code_runner.nvim",
    cmd = "RunCode",
    config = function()
      require("code_runner").setup {
        mode = "toggleterm",
        before_run_filetype = function() vim.cmd ":w" end,
        filetype = {
          cpp = {
            "cd $dir && clang++ $fileName --target=x86_64-w64-windows-gnu -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
          },
          ps1 = {
            "cd $dir && powershell -file $fileName",
          },
          go = {
            "cd $dir && go run $fileName",
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
    cmd = { "WorkspacesAdd", "WorkspacesList", "WorkspacesOpen" },
    config = function()
      require("workspaces").setup {
        hooks = {
          open = { "Neotree toggle" },
        },
      }
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      direction = "horizontal",
      float_opts = { border = "rounded" },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
