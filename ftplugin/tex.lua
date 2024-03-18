local utils = require "astronvim.utils"
local custom_map = { i = {}, n = {}, v = {}, t = {} }
vim.wo.wrap = true
custom_map.n["<down>"] = { "gj" }
custom_map.n["<up>"] = { "gk" }
custom_map.n["j"] = { "gj" }
custom_map.n["k"] = { "gk" }
utils.set_mappings(astronvim.user_opts("mappings", custom_map))
