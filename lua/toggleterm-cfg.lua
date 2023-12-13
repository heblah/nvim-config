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
toggleterm.setup()

------
-- Toggleterm-manager configuration
------
local manager_status_ok, toggleterm_manager = pcall(require, "toggleterm-manager")
if not manager_status_ok then
	return
end
toggleterm_manager.setup()
print "toggle manager"
