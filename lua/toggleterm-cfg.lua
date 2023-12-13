---------------------------------------------
-- Toggleterm and toggleterm-manager configurations
---------------------------------------------

------
-- Toggleterm configuration
------
local toggleterm_status_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_status_ok then
	return
end
vim.o.hidden = true

-- Default ToggleTerm terminal
toggleterm.setup{
	direction = 'float',
	float_opts = {
		border = 'single'
	}
}
vim.keymap.set({'n', 'i'}, '<Leader>t', '<ESC>:ToggleTerm<CR>')
vim.keymap.set({'n', 'i'}, '<Leader>T', '<ESC>:ToggleTerm direction=horizontal<CR>')
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n><C-w><C-w>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

------
-- Toggleterm-manager configuration
------
local manager_status_ok, toggleterm_manager = pcall(require, "toggleterm-manager")
if not manager_status_ok then
	return
end
toggleterm_manager.setup()
