vim.g.mapleader = ","
-- [[ https://github.com/alpha2phi/neovim-for-beginner/blob/25-refactoring/after/plugin/keymaps.lua ]]
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Legendary keymap
keymap("n", "<space>", "ciw", default_opts) -- delte word and insert
keymap("n", "<space>d", "diw", default_opts) -- delte word and normal mode
keymap("n", "<space>p", "cip", default_opts) -- delete inside entire paragraph & insert mode
-- IMPORTANT 2k ci\("{[ -- Delete words between these characters

-- Refactoring
keymap("n", "<leader>vp", "<S-v>%", default_opts) -- Select para (VISUAL)
--[[ keymap("n", "<leader>vpd", "<S-v>%d", default_opts) -- Select para & delete it
keymap("n", "<leader>vp<Space>", "<S-v>%di", default_opts) -- Select para, delete, & go into insert mode
keymap("n", "<leader>vpy", "<S-v>%y", default_opts) -- Select para & yank it (copy) ]]

-- Better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", default_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", default_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", default_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- -- Always center
-- keymap("n", "k", "kzz", default_opts)
-- keymap("n", "j", "jzz", default_opts)
-- keymap("n", "G", "Gzz", default_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- Switch buffer
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<Up>", ":resize -1<CR>", default_opts)
keymap("n", "<Down>", ":resize +1<CR>", default_opts)

-- Insert blank line
keymap("n", "]<Space>", "o<Esc>", default_opts)
keymap("n", "[<Space>", "O<Esc>", default_opts)
