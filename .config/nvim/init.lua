--  Improve startup time for Neovim 
local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

require('base')
require('highlights')
require('mappings')
require('plugins')

local has = function(x)
	return vim.fn.has(x) == 1
end

local is_linux = has "linux"
local is_mac = has "macunix"
local is_win = has "win32"

if is_linux then
	require('linux')
end
if is_mac then
	require('macos')
end
if is_win then
	require('windows')
end

-- [[ASTRONVIM]]
-- local impatient_ok, impatient = pcall(require, "impatient")
-- if impatient_ok then impatient.enable_profile() end
-- 
-- for _, source in ipairs {
--   "core.utils",
--   "core.options",
--   "core.bootstrap",
--   "core.plugins",
--   "core.autocmds",
--   "core.mappings",
--   "configs.which-key-register",
-- } do
--   local status_ok, fault = pcall(require, source)
--   if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
-- end
-- 
-- astronvim.conditional_func(astronvim.user_plugin_opts("polish", nil, false))

