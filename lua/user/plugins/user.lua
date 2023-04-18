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
		"CRAG666/code_runner.nvim",
		cmd = "RunCode",
		config = function()
			require("code_runner").setup({
				mode = "toggleterm",
				before_run_filetype = function()
					vim.cmd(":w")
				end,
				filetype = {
					ps1 = {
						"cd $dir",
						"powershell -file $fileName",
					},
				},
			})
		end,
	},
	{
		"natecraddock/workspaces.nvim",
		cmd = "Telescope workspaces",
		config = function()
			require("workspaces").setup({
				hooks = {
					open = { "Telescope find_files" },
				},
			})
		end,
	},
}
