return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    update_in_insert = true,
    underline = true,
  },
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local float_opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always", -- show source in diagnostic popup window
        prefix = " ",
      }

      if not vim.b.diagnostics_pos then vim.b.diagnostics_pos = { nil, nil } end

      local cursor_pos = vim.api.nvim_win_get_cursor(0)
      if
        (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
        and #vim.diagnostic.get() > 0
      then
        vim.diagnostic.open_float(nil, float_opts)
      end
      vim.b.diagnostics_pos = cursor_pos
    end,
  }),
  lsp = {
    config = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              extraEnv = { CARGO_PROFILE_RUST_ANALYZERE_INHERITS = "dev" },
              extraArgs = { "--profile", "rust-analyzer" },
            },
          },
        },
      },
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      --  "pyright",
      --  ["server-settings"] = {
      --    ltex = {
      --      language = "de-DE",
      --    },
      --  },
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    change_detection = {
      enabled = false,
    },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    if vim.fn.has "win32" == 1 then
      require("nvim-treesitter.install").compilers = { "zig" }
      local powershell_options = {
        shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
        shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
        shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
        shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
        shellquote = "",
        shellxquote = "",
      }

      for option, value in pairs(powershell_options) do
        vim.opt[option] = value
      end
    end
    local rt = require "rust-tools"
    rt.setup {
      tools = {
        executor = require("rust-tools.executors").toggleterm,
      },
      hover_actions = {
        auto_focus = true,
      },
      server = {
        on_attach = function(_, bufnr) end,
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
              extraArgs = { "--all", "--", "-w", "clippy::all" },
            },
          },
        },
      },
    }
    local telescope = require "telescope"
    local utils = require "astronvim.utils"
    utils.conditional_func(telescope.load_extension, utils.is_available "workspaces.nvim", "workspaces")
    require("ltex-client").setup()
    require("lspconfig").ltex.setup {
      settings = {
        ltex = {
          language = "de-DE",
        },
      },
    }
    vim.api.nvim_create_user_command(
      "InitDefaultMason",
      "MasonInstall codelldb gitlint intelephense json-lsp jsonlint lemminx lua-language-server php-debug-adapter phpstan python-lsp-server rust-analyzer rustfmt selene xmlformatter yaml-language-server yamlfmt yamllint",
      { desc = "Init my default mason packages" }
    )

    vim.api.nvim_create_user_command(
      "InitDefaultTreeSitter",
      "TSInstall! gitcommit html javascript lua php python rust vim bash dockerfile markdown make json toml yaml",
      { desc = "Init my default TS packages" }
    )
  end,
}
