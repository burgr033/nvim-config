local is_slim = vim.env.NVIM_SLIM == "1"
local is_desktop = not is_slim

local M = {}

function M.Server() return is_slim end

function M.Desktop() return is_desktop end

return M
