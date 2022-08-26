--  Improve startup time for Neovim 
-- local impatient_ok, impatient = pcall(require, "impatient")
-- if impatient_ok then impatient.enable_profile() end

for _, source in ipairs {
    'core.base',
    'core.keymaps',
    'core.highlights',
    -- 'core.autocmds',
} do
    local status_ok, fault = pcall(require, source)
    if not status_ok then
        vim.api.nvim_err_writeln('Failed to load ' .. source .. '\n\n' .. fault)
    end
end

-- no need to load this immediately, since we have packer_compiled
vim.defer_fn(function ()
    require('core.plugins')
end, 1000)

