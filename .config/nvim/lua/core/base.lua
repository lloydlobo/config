-- local api = vim.api
-- local g = vim.g
local opt = vim.opt
-- local cmd = vim.cmd

vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.tabstop = 4

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

vim.opt.scrolloff = 10
opt.scrollback = 100000 -- cheat.sh -- terminal buffer scrollback size
vim.opt.showcmd = true
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.title = true
vim.opt.wrap = false -- No Wrap lines

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.shell = "fish"

vim.opt.backup = false
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- https://github.com/mbbill/undotree#configuration
vim.opt.undofile = true

vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

opt.timeoutlen = 300 --	Time in milliseconds to wait for a mapped sequence to complete.
opt.showmode = false -- Do not need to show the mode. We use the statusline instead.

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50 -- 250

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

opt.joinspaces = false -- No double spaces with join after a dot
opt.laststatus = 3 -- Global statusline
opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- disable nvim intro
opt.shortmess:append("sI")

-- https://github.com/nikbrunner/vin/blob/b6704fb384159b1dade13f6723fce346625d0f58/lua/user/options.lua#L51
-- hide vertical borders
vim.cmd([[set fillchars+=vert:\ ]])

-- Better search
opt.path:remove("/usr/include")
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
-- vim.cmd [[set path=.,,,$PWD/**]] -- Set the path directly

-- https://github.com/alpha2phi/neovim-for-beginner/blob/25-refactoring/after/plugin/defaults.lua

-- Copilot
-- cmd [[
--     imap <silent><script><expr> <C-s> copilot#Accept("\<CR>")
--     let g:copilot_no_tab_map = v:true
-- ]]
