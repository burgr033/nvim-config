-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
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
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
