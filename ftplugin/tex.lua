local utils = require "astronvim.utils"
local custom_map = { i = {}, n = {}, v = {}, t = {} }
custom_map.n["<localleader>a"] = {
  function() vim.lsp.buf.code_action() end,
  desc = "LSP code action",
}
custom_map.n["<localleader>c"] = { "<cmd>VimtexCompile<CR>", desc = "Compile" }
custom_map.n["<localleader>v"] = { "<cmd>VimtexView<CR>", desc = "View" }

custom_map.n["<F8>"] = { "<cmd>VimtexCompile<CR>" }

utils.set_mappings(astronvim.user_opts("mappings", custom_map))
local cmp = require "cmp"
cmp.setup {
  sources = cmp.config.sources { { name = "omni" } },
}
cmp.setup.buffer {
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
        buffer = "[Buffer]",
        -- formatting for other sources
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "omni" },
    { name = "luasnip" },
    { name = "buffer" },
    -- other sources
  },
}
