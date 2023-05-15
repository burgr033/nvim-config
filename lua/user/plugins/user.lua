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
		"mfussenegger/nvim-dap",
		enabled = true
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "cigh033/alpha-nvim-bofh-excuse" },
		cmd = "Alpha"
	},	
	
	{
		"CRAG666/code_runner.nvim",
		cmd = "RunCode"
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = "java"
	},
	{
		"natecraddock/workspaces.nvim",
		cmd = "Telescope workspaces"
	},
}
