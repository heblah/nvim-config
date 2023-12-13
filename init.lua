--------------------------------------------------------------------------------
--                        Neovim: lua configuration file                      --
--------------------------------------------------------------------------------

------
-- Neovim options
------
vim.g.mapleader = ","
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.showcmd = true
vim.o.splitbelow = true
vim.opt.splitright = true
vim.opt.listchars = {
  tab = ">-",
  trail = ".",
  precedes = "<",
  extends = ">",
  eol = "$"
}
-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

------
-- Neovim autocommands
------
-- Go in insert mode when entering in a Neovim terminal
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("TermInsertMode", {clear = true}),
  callback = function() 
    vim.cmd("startinsert")
  end
})
vim.api.nvim_create_autocmd({"BufWinEnter","WinEnter"}, {
  pattern = "term://*",
  group = vim.api.nvim_create_augroup("TermInsertMode", {clear = true}),
  callback = function()
    vim.cmd("startinsert")
  end
})

------
-- Key mapping
------
-- Esc key:
vim.keymap.set({'i'}, 'jj', '<ESC>:w<CR>', {silent = true})
-- Save / quit current buffer:
vim.keymap.set({'n', 'i'}, '<Leader>w', '<ESC>:w<CR>', {silent = true})
vim.keymap.set({'n', 'i'}, '<Leader>W', '<ESC>:wa<CR>', {silent = true})
vim.keymap.set({'n', 'i'}, '<Leader>q', '<ESC>:q<CR>', {silent = true})
vim.keymap.set({'n', 'i'}, '<Leader>Q', '<ESC>:wqa<CR>', {silent = true})
-- Open terminal:
vim.keymap.set({'n', 'i'}, '<Leader>t', '<ESC>:vsplit term://zsh<CR>')
vim.keymap.set({'n', 'i'}, '<Leader><S-t>', '<ESC>:split term://zsh<CR>')
-- Split window:
vim.keymap.set('n', '<Leader>s', ':split<CR>')
vim.keymap.set('n', '<Leader>v', ':vsplit<CR>')
-- Redim neovim buffers:
vim.keymap.set('n', '<C-up>', ':resize +2 <CR>')
vim.keymap.set('n', '<C-down>', ':resize -2 <CR>')
vim.keymap.set('n', '<C-right>', ':vertical resize +2 <CR>')
vim.keymap.set('n', '<C-left>', ':vertical resize -2 <CR>')
-- Navigate seamlessly between nvim buffers and tmux panes:
vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<CR>')
vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<CR>')
vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<CR>')
vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<CR>')
-- NvimTree toggle
vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Leader>E', ':NvimTreeFocus<CR>')

------
-- Plugins manager: lazy
------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- List of plugins with basic configurations
require("lazy").setup('plugins')

-- Extended plugin configuration files when needed
require("cmp-cfg")
require("telescope-cfg")
require("toggleterm-cfg")
--require("lua-cfg.lsp")

------
-- Neovim scheme color depending on hour
------
vim.g.termguicolors = true
vim.cmd("color vscode")
local light_start = 9
local light_end = 18
local hour = tonumber(vim.fn.strftime("%H"))

if hour >= light_start and hour < light_end then
  vim.o.background = "light"
else
  vim.o.background = "dark"
end
