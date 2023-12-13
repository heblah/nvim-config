---------------------------------------------
-- Toggleterm and Toggleterm-manager configurations
---------------------------------------------

------
-- Toggleterm configuration
------
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end
print "coucou"

toggleterm.setup({})

------
-- Toggleterm-manager configuration
------
