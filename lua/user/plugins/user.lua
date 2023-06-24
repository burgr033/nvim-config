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
		enabled = true,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "cigh033/alpha-nvim-bofh-excuse" },
		cmd = "Alpha",
	},
	{
		"lervag/vimtex",
		ft = { "tex", "bib" },
		opts = { patterns = { "*.tex" } },
		config = function(_, opts)
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = opts.patterns,
				callback = function()
					vim.cmd([[VimtexCompile]])
				end,
			})
			vim.g.vimtex_compiler_latexmk = {
				build_dir = ".out",
				options = {
					"-shell-escape",
					"-verbose",
					"-file-line-error",
					"-interaction=nonstopmode",
					"-synctex=1",
				},
			}
			if vim.fn.has("win32") == 1 then
				vim.g.vimtex_view_general_viewer = "SumatraPDF"
				vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
			end
			if vim.fn.has("linux") == 1 then
				vim.g.vimtex_view_method = "zathura"
			end
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
		"CRAG666/code_runner.nvim",
		cmd = "RunCode",
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},
	{
		"natecraddock/workspaces.nvim",
		cmd = "Telescope workspaces",
	},
}
