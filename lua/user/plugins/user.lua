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
		"skywind3000/asyncrun.vim",
		lazy = false,
	},
	{
		"natecraddock/workspaces.nvim",
		lazy = false,
		config = function()
			require("workspaces").setup(
				{
					hooks = {
						open = { "Telescope find_files" },
					}
				}
			)
		end,
	},
}
