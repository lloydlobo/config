--[[
-- plugin name will be used to reload the loaded modules
--]]
local package_name = 'reload-changes'

-- add the escape character to special characters
local escape_pattern = function (text)
    return text:gsub("([^%w])", "%%%1")
end

-- unload loaded modules by the matching text
local unload_packages = function ()
	local esc_package_name = escape_pattern(package_name)

	for module_name, _ in pairs(package.loaded) do
		if string.find(module_name, esc_package_name) then
			package.loaded[module_name] = nil
		end
	end
end

-- executes the run method in the package
local run_action = function ()
	-- add fucntion call with your specific code here
	-- Example:
		-- require(package_name).containers.list_containers()
end

-- unload and run the function from the package
function Reload_and_run()
	unload_packages()
	run_action()
end

local set_keymap = vim.api.nvim_set_keymap

set_keymap('n', ',r', '<cmd>luafile dev/init.lua<cr>', {})
set_keymap('n', ',w', '<cmd>lua Reload_and_run()<cr>', {})

-- https://github.com/dgrbrady/nvim-docker/blob/main/dev/init.lua
-- Execute `:luafile dev/init.lua` once 
-- 	- to load the file and,
-- 	- enable the keybinding
-- 	PLENARY can do the same
-- 	https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/lua/theprimeagen/init.lua
-- function R(name)
--     require("plenary.reload").reload_module(name)
-- end

