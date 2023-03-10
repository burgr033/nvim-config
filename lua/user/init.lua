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
    virtual_text = false,
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

                        if not vim.b.diagnostics_pos then
                                vim.b.diagnostics_pos = { nil, nil }
                        end

                        local cursor_pos = vim.api.nvim_win_get_cursor(0)
                        if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
                            and #vim.diagnostic.get() > 0
                        then
                                vim.diagnostic.open_float(nil, float_opts)
                        end

                        vim.b.diagnostics_pos = cursor_pos
                end,
        }),  

  lsp = {
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
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin", "matchparen" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
                -- see https://github.com/nvim-treesitter/nvim-treesitter/issues/1985
                -- some parsers dont work on windows if they were compiled with gcc or something else.
                if vim.fn.has("Windows") then
                        require 'nvim-treesitter.install'.compilers = { "clang" }
                end
                vim.api.nvim_create_user_command("InitDefaultMason",
                        "MasonInstall codelldb gitlint intelephense json-lsp jsonlint lemminx lua-language-server php-debug-adapter phpstan python-lsp-server rust-analyzer rustfmt selene xmlformatter yaml-language-server yamlfmt yamllint",
                        { desc = "Init my default mason packages" })
                vim.api.nvim_create_user_command("InitDefaultTreeSitter",
                        "TSInstall! gitcommit html javascript lua php python rust vim bash dockerfile markdown make json toml yaml",
                        { desc = "Init my default TS packages" })
                require('lspconfig').pylsp.setup {
                        settings = {
                                pylsp = {
                                        plugins = {
                                                pycodestyle = {
                                                        ignore = { "E501" },
                                                },
                                                flake8 = {
                                                        ignore = { "E501" },
                                                }
                                        }
                                }
                        }
                }
  end,
}
