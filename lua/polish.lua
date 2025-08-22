vim.api.nvim_create_user_command("Scratch", function() require("snacks").scratch() end, {})

if vim.fn.has "win32" == 1 then
  -- TS use zig because llvm and gcc are borked
  require("nvim-treesitter.install").compilers = { "zig" }
  -- shell options
  local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }
  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end

if vim.env.SSH_TTY or vim.fn.has "wsl" then
  vim.o.clipboard = "unnamedplus"
  local osc52 = require "vim.ui.clipboard.osc52"
  local function paste()
    return {
      vim.fn.split(vim.fn.getreg "", "\n"),
      vim.fn.getregtype "",
    }
  end

  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy "+",
      ["*"] = osc52.copy "*",
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
  }
end
