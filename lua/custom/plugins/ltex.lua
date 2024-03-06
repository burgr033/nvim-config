return {
  'icewind/ltex-client.nvim',
  ft = { 'tex', 'bib' },
  config = function()
    require('ltex-client').setup()
    require('lspconfig').ltex.setup {
      settings = {
        ltex = {
          language = 'de-DE',
        },
      },
    }
  end,
}
