--  Improve startup time for Neovim 
local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

local g = vim.g

g.mapleader = ' '

-- Load source files configs
for _, source in ipairs {
    'base',
    'highlights',
    'mappings',
    -- 'plugins',
} do
    local status_ok, fault = pcall(require, source)
    if not status_ok then
        vim.api.nvim_err_writeln('Failed to load ' .. source .. '\n\n' .. fault)
    end
end

-- no need to load this immediately, since we have packer_compiled
vim.defer_fn(function()
    require("plugins")
end, 5000)

local has = function(x) return vim.fn.has(x) == 1 end

local is_linux = has "linux"
local is_mac = has "macunix"
local is_win = has "win32"

if is_linux then require('linux') end
if is_mac then require('macos') end
if is_win then require('windows') end

-- To determine if neovim is running in vscode (for init.vim)
--[[ if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
endif ]]

