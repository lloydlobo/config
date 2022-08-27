-- Improve startup time for Neovim
local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
    impatient.enable_profile()
    print("impatient_ok")
end

-- Load core modules
for _, source in ipairs {
    'core',
} do
    local status_ok, fault = pcall(require, source)
    if not status_ok then
        vim.api.nvim_err_writeln('Failed to load ' .. source .. '\n\n' .. fault)
    end
end

-- astronvim.conditional_func(astronvim.user_plugin_opts("polish", nil, false))
