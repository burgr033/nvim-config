local success, machine_override_config = pcall(require, "machine_override")
local vault_path, todo_path, templates_path

if success and type(machine_override_config) == "table" then
  -- machine_override_config is the actual module table
  vault_path = machine_override_config.obsidian_vault_path or "~/Documents/Vault"
  todo_path = machine_override_config.obsidian_todo_path or "~/Documents/vault/todo.md"
  templates_path = machine_override_config.templates_path or (vault_path .. "/90 meta/01 Templates")
else
  -- Either pcall failed or module didn't return a table, use defaults
  vault_path = "~/Documents/Vault"
  todo_path = "~/Documents/Vault/todo.md"
  templates_path = vault_path .. "/90 meta/01 Templates"
end

---@type LazySpec
return {
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
}
