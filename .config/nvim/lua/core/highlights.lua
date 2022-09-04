vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.wildignorecase = true
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.wildignore:append("**/.git/*")
vim.opt.pumblend = 5
vim.opt.background = "dark"
--[[ For NeoVim, you can set the fillchars value for eob to a space character and that will effectively hide it. (This might not work for plain Vim).
https://stackoverflow.com/questions/3813059/is-it-possible-to-not-display-a-for-blank-lines-in-vim-neovim ]]
vim.cmd([[set fillchars=eob:\ ,fold:\ ,vert:\│]]) -- QUICKFIX Hide tilde squigly line at end of file -- https://stackoverflow.com/a/70887809

-- https://github.com/RishabhRD/rdconfig/blob/master/.config/nvim/lua/rd/ts_config.lua
-- vim.cmd [[highlight IncludedC guibg=#373b41]]
-- vim.cmd [[highlight Normal guibg=default]]
