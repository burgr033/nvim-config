if vim.fn.has "win32" == 1 then
  -- TS use zig because llvm and gcc are borked
  require("nvim-treesitter.install").compilers = { "zig" }
  -- shell options
  local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }
  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end

local hl = require "astroui.status.hl"
local status_utils = require "astroui.status.utils"

local utils = require "astrocore"
local get_icon = require("astroui").get_icon
local extend_tbl = utils.extend_tbl
local is_available = utils.is_available

local M = {}

M.event = "User"
M.pattern = "CodeiumChanged"

M.is_available = function() return is_available "codeium.vim" end

M.get_state = function() return vim.fn["codeium#GetStatusString"]() end

M.toggle = function()
  if M.get_state() == "OFF" then
    vim.cmd "CodeiumEnable"
  else
    vim.cmd "CodeiumDisable"
  end
end
