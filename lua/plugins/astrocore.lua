-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        scrolloff = 25, -- sets vim.opt.scrolloff
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        cmdheight = 1,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<leader>bD"] = {
          function()
            require("astronvim.utils.status").heirline.buffer_picker(
              function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        ["q"] = { "<nop>", desc = "I don't use macros and press it accidentally all the time" },
        ["ö"] = { ":", desc = "" },
        ["ü"] = { "{", desc = "" },
        ["+"] = { "}", desc = "" },
        ["-"] = { "/", desc = "" },
        ["<C-S-Up>"] = { "<cmd>resize +2<cr>", desc = "Increase Window height" },
        ["<C-S-Down>"] = { "<cmd>resize -2<cr>", desc = "Decrease Window height" },
        ["<C-S-Left>"] = { "<cmd>vertical resize +2<cr>", desc = "Increase Window width" },
        ["<C-S-Right>"] = { "<cmd>vertical resize -2<cr>", desc = "Decrease Window width" },
        ["<C-Left>"] = { "<C-w>h", desc = "Move to left split" },
        ["<C-Down>"] = { "<C-w>j", desc = "Move to below split" },
        ["<C-Up>"] = { "<C-w>k", desc = "Move to above split" },
        ["<C-Right>"] = { "<C-w>l", desc = "Move to right split" },
        ["<C-Tab>"] = { "<cmd>bnext<cr>", desc = "Tab through Buffers" },
        ["<S-Tab>"] = { "<cmd>bprevious<cr>", desc = "Tab through Buffers" },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>r"] = { name = "♞ Run" },
        ["<leader>rr"] = { "<cmd>MFROpen<cr>", desc = "Run Code" },
        ["<leader>rc"] = { "<cmd>MFRRun clean<cr>", desc = "Run clean" },
        ["<leader>rb"] = { "<cmd>MFRRun build<cr>", desc = "Run build" },
        ["<leader>rm"] = { "<cmd>MFRCreate<cr>", desc = "Create Makefile" },
        ["<leader>b"] = { name = " Buffers" },
        ["<leader>W"] = { name = " Workspaces" },
        ["<leader>Wl"] = { "<cmd>Telescope workspaces<cr>", desc = "list Workspaces" },
        ["<leader>Wo"] = { "<cmd>WorkspacesOpen<cr>", desc = "open Workspace" },
        ["<leader>Wa"] = { "<cmd>WorkspacesAdd<cr>", desc = "add current directory to Workspaces" },
        ["<leader>lj"] = {
          function() vim.lsp.buf.definition() end,
          desc = "Jump to Definition",
        },

        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      i = {},
      t = {
        ["<C-Left>"] = { "<C-w>h", desc = "Move to left split" },
        ["<C-Down>"] = { "<C-w>j", desc = "Move to below split" },
        ["<C-Up>"] = { "<C-w>k", desc = "Move to above split" },
        ["<C-Right>"] = { "<C-w>l", desc = "Move to right split" },

        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
