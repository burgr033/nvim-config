local config = require "machine_override"
local vault_path = config.obsidian_vault_path
local todo_path = config.obsidian_todo_path
local templates_path = config.templates_path
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
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    cmd = "ObsidianTodo",
    lazy = true,
    event = {
      "BufReadPre " .. vault_path .. "/*.md",
      "BufNewFile " .. vault_path .. "/*.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "efirlus/quickadd.nvim",
        config = function()
          require("quickadd").setup {
            todo_path = todo_path,
          }
        end,
      },
      {

        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["gf"] = {
                function()
                  if require("obsidian").util.cursor_on_markdown_link() then
                    return "<Cmd>ObsidianFollowLink<CR>"
                  else
                    return "gf"
                  end
                end,
                desc = "Obsidian Follow Link",
              },
              ["<Localleader>f"] = { false, desc = "find" },
              ["<Localleader>ff"] = { "<cmd>Obsidian quick_switch<CR>", desc = "find files in vault" },
              ["<Localleader>fw"] = { "<cmd>Obsidian search<CR>", desc = "find text in vault" },
              ["<Localleader>ft"] = { "<cmd>Obsidian tags<CR>", desc = "find tags in vault" },
              ["<Localleader>t"] = { "<cmd>Obsidian toc<CR>", desc = "toc" },
              ["<Localleader>x"] = { "<cmd>Obsidian toggle_checkbox<CR>", desc = "checkbox" },
              ["<Localleader>n"] = { false, desc = " new" },
              ["<Localleader>nn"] = { "<cmd>Obsidian new<CR>", desc = "new note" },
              ["<Localleader>l"] = { false, desc = " links" },
              ["<Localleader>lj"] = { "<cmd>Obsidian follow_link<CR>", desc = "follow link" },
              ["<Localleader>ln"] = { "<cmd>Obsidian link_new<CR>", desc = "new link" },
              ["<Localleader>ne"] = { "<cmd>Obsidian extract_note<CR>", desc = "text2new note" },
              ["<Localleader>nt"] = { "<cmd>Obsidian new<CR>", desc = "new note (template)" },
            },
          },
        },
      },
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = vault_path,
        },
      },
      picker = {
        name = "snacks.pick",
      },
      templates = {
        folder = templates_path,
      },
      completion = {
        nvim_cmp = false,
        blink = true,
      },
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          suffix = "new-note"
        end
        return tostring(suffix)
      end,
    },
    init = function()
      vim.api.nvim_create_user_command("ObsidianTodo", function()
        vim.cmd("edit " .. todo_path)
        vim.cmd "normal! Go"
      end, {})
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.wo.wrap = true
          vim.wo.linebreak = true
          vim.wo.breakindent = true
          vim.wo.conceallevel = 1
        end,
      })
    end,
  },
}
