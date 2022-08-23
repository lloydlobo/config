local cmd = vim.cmd
local indent = 4

vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Make hybrid line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Save undo history
vim.o.undofile = true
vim.opt.undolevels = 10000

-- Decrease update time
vim.o.updatetime = 250                      -- save swap file and trigger CursorHold
vim.wo.signcolumn = 'yes'                   -- Always show the signcolumn, otherwise it would shift the text each time

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.opt.autowrite = true                    -- enable auto write
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.conceallevel = 2                    -- Hide * markup for bold and italic
vim.opt.concealcursor = "n"                 -- Hide * markup for bold and italic
vim.opt.confirm = true                      -- confirm to save changes before exiting
vim.opt.guifont = "FiraCode Nerd Font:h12"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.hidden = true                       -- Enable modified buffers in background
vim.opt.inccommand = "split"                -- preview incremental substitute
vim.opt.joinspaces = false                  -- No double spaces with join after a dot
vim.opt.list = true                         -- Show some invisible characters (tabs...
-- vim.opt.pumblend = 10                       -- Popup blend
-- vim.opt.pumheight = 10                      -- Maximum number of entries in a popup
vim.opt.scrolloff = 10                      -- Lines of context
vim.opt.shiftround = true                   -- Round indentvim.opt.shiftwidth = indent -- Size of an indent
vim.opt.shiftwidth = indent                 -- Size of indent
vim.opt.showmode = false                    -- dont show mode since we have a statusline
vim.opt.sidescrolloff = 8                   -- Columns of context
vim.opt.smartindent = true                  -- Inserts indent automatically
vim.opt.tabstop = indent                    -- Number of spaces tabs count for
vim.opt.hlsearch = false
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true                    -- Use spaces instead of tabs
vim.opt.shell = 'fish'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true                   -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smartcase = true                    -- Don't ignore case with capitals
vim.opt.smarttab = true
vim.opt.splitbelow = true                   -- Put new windows below current
vim.opt.splitright = true                   -- Put new windows right of curr
vim.opt.breakindent = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' }                -- Finding files - Search down into subfolders
-- vim.opt.termguicolors = true                -- True color support
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.wildmode = "longest:full,full"      -- Command-line completion mode
vim.opt.wrap = false                        -- Disable line wrap
-- vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }



-- Undercurl (works well with lsp-colors) (also linked in tmux.conf)
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- Set universal clipboard & sync with system clipboard
vim.o.clipboard = 'unnamedplus'
-- To ALWAYS use the clipboard for ALL operations (instead of interacting with the '+' and/or '*' registers explicitly): > set clipboard+=unnamedplus
vim.opt.clipboard:append { 'unnamedplus' }  -- linux.lua | macos.lua | windows.lua

-- -- Check if we need to reload the file when it changed
-- cmd("au FocusGained * :checktime")
-- 
-- -- show cursor line only in active window
-- cmd([[
--   autocmd InsertLeave,WinEnter * set cursorline
--   autocmd InsertEnter,WinLeave * set nocursorline
-- ]])
-- 
-- -- go to last loc when opening a buffer
-- cmd([[
--   autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
-- ]])
-- 
-- -- Highlight on yank
-- cmd("au TextYankPost * lua vim.highlight.on_yank {}")
-- 
-- -- windows to close with "q"
-- vim.cmd([[autocmd FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR>]])
-- vim.cmd([[autocmd FileType man nnoremap <buffer><silent> q :quit<CR>]])
-- 
