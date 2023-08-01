local utils = require "astronvim.utils"
local rt = require "rust-tools"
local custom_map = { i = {}, n = {}, v = {}, t = {} }
custom_map.n["<localleader>r"] = {
  function() rt.hover_actions.hover_actions() end,
  desc = "Hover Action",
}
custom_map.n["<localleader>a"] = {
  function() rt.code_action_group.code_action_group() end,
  desc = "Code Action",
}
custom_map.n["<localleader>c"] = {
  function() rt.open_cargo_toml.open_cargo_toml() end,
  desc = "open Cargo.toml",
}
custom_map.n["<F8>"] = {
  function() rt.runnables.runnables() end,
}

utils.set_mappings(astronvim.user_opts("mappings", custom_map))
