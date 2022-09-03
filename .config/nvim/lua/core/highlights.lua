vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.wildignorecase = true
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.wildignore:append("**/.git/*")
vim.opt.pumblend = 5
vim.opt.background = "dark"
-- vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])

-- https://github.com/RishabhRD/rdconfig/blob/master/.config/nvim/lua/rd/ts_config.lua
-- vim.cmd [[highlight IncludedC guibg=#373b41]]
-- vim.cmd [[highlight Normal guibg=default]]
