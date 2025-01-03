-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

local set = vim.opt

-- Enable powershell as your default shell
set.shell = "pwsh.exe"
set.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]]

-- Set a compatible clipboard manager
vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}

-- Set indentation options
set.tabstop = 4          -- Number of spaces that a <Tab> counts for
set.shiftwidth = 4       -- Number of spaces to use for each step of (auto)indent
set.softtabstop = 4      -- Number of spaces to insert when pressing <Tab> in insert mode
set.expandtab = true     -- Use spaces instead of tabs

-- Disable LunarVim's default mapping for Ctrl+q
-- To use it for visual block mode
lvim.keys.normal_mode["<C-q>"] = false

-- Change Shift+h and Shift+l to cycle buffers/tabs
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"

-- Create a custom command for diffput to all buffers
function DiffputAll()
  local current_buffer = vim.api.nvim_get_current_buf()
  local windows = vim.api.nvim_list_wins()
  for _, win in ipairs(windows) do
    local buf = vim.api.nvim_win_get_buf(win)
    if buf ~= current_buffer and vim.api.nvim_buf_is_valid(buf) then
      vim.cmd('diffput ' .. buf)
    end
  end
  vim.cmd('diffupdate')
end
vim.api.nvim_create_user_command('DiffputAll', DiffputAll, {})

---- Add language server for HQL
---- print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))
--lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(
--  function(server) return server ~= "sqlls" end,
--  lvim.lsp.automatic_configuration.skipped_servers)
---- print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))
--require("lvim.lsp.manager").setup("sqlls", {
--  cmd = {"sql-language-server", "up", "--method", "stdio"},
--  filetypes = {"sql", "mysql", "hql"},  -- Add "hql" here
--  root_dir = function() return vim.loop.cwd() end,
--})
