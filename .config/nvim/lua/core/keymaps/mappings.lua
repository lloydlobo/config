-- Extra mappings
-- [[ Leader Keymap ]]
vim.g.mapleader = ","
-- vim.g.localmapleader = "</>"
--
-- LEADER KEY (2 Scopes)
-- 1. Space for  plugin related keybindings
-- 2. , for text manipulation, debugging, and lsp related bindings
--
-- TODO Clever F-repeat (clever-f plugin) fF instead of ,;

-- See `:help key-notation`
local keymap = vim.keymap

-- Keymaps for better default experience -- ',' is the leader key
-- See `:help vim.keymap.set()`
keymap.set({ 'n', 'v' }, ',', '<Nop>', { silent = true })

-- [[ --------------------- ]]
-- [[ Interactive shortcuts ]]
-- [[ --------------------- ]]

-- goto start/end of line in insert mode
keymap.set("i", "<C-b>", "<C-o>0")
keymap.set("i", "<C-z>", "<C-o>$")

-- control c to toggle highlight for search
keymap.set(
    "n", "<C-C>",
    ":if (&hlsearch == 1) | set nohlsearch | else | set hlsearch | endif<cr>"
)

--  https://github.com/0xsamrath/.dotfiles/blob/main/nvim/lua/keymaps/init.lua
-- surrounding with parantheses -- Highlight in VISUAL MODE!!! wrap
keymap.set("v", "<leader>'", "<esc>`>a'<esc>`<i'<esc>")
keymap.set("v", '<leader>"', '<esc>`>a"<esc>`<i"<esc>')
keymap.set("v", "<leader>(", "<esc>`>a)<esc>`<i(<esc>")
keymap.set("v", "<leader>[", "<esc>`>a]<esc>`<i[<esc>")
keymap.set("v", "<leader>{", "<esc>`>a}<esc>`<i{<esc>")

-- [[ -------END----------- ]]
-- [[ Interactive shortcuts ]]
-- [[ --------------------- ]]

-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------

-- [[ -------------------- ]]
-- [[       SETUP          ]]
-- [[ -------------------- ]]

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set('n', 'x', '"_x')         -- deletes forward chars

-- [[Highlight on yank]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    group = highlight_group,
    pattern = '*',
})

-- remove the L and Q commands
keymap.set("n", "L", "<Nop>")
keymap.set("n", "Q", "<Nop>")

-- [[ -------END---------- ]]
-- [[       SETUP          ]]
-- [[ -------------------- ]]
