require('base')
require('highlights')
require('mappings')
require('plugins')

-- To ALWAYS use the clipboard for ALL operations (instead of interacting with the '+' and/or '*' registers explicitly): > set clipboard+=unnamedplus
-- vim.opt.clipboard:append { 'unnamedplus' }       -- linux.lua | macos.lua | windows.lua

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

