require("which-key").setup(astronvim.user_plugin_opts("plugins.which-key", {
  plugins = {
    spelling = { enabled = true },
  },
  window = {
    border = "rounded",
    padding = { 1, 1, 1, 1 },
  },
  disable = { filetypes = { "TelescopePrompt" } },
}))
