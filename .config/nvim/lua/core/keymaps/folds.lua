-- https://alpha2phi.medium.com/neovim-for-beginners-code-folding-7574925412ea
local opt = vim.opt

-- Treesitter based folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- ufo plugin
-- LSP based folding
--[[ opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = -1
opt.foldenable = true ]]
-- local cmd = vim.cmd
-- cmd([[
-- 	set foldmethod=indent
-- 	set foldnestmax=10
-- 	set nofoldenable
-- 	set foldlevel=2
-- ]]) -- https://unix.stackexchange.com/questions/141097/how-to-enable-and-use-code-folding-in-vim/336537#336537

-- https://alpha2phi.medium.com/neovim-for-beginners-code-folding-7574925412ea
--[[ Fold Method
The foldmethodoption (:h 'foldmethod’) defines the kind of folding used for the current window.
Possible values for this option are
    manual (:h fold-manual) — Folds are created manually.
    indent (:h fold-indent) — Lines with equal indent form a fold.
    expr (:h fold-expr) — foldexpr gives the fold level of a line.
    marker (:h fold-marker) — Markers are used to specify folds.
    syntax (:h fold-syntax) — Syntax highlighting items specify folds.
    diff (:h fold-diff) — Fold text that is not changed. ]]

-- Treesitter based folding
-- cmd([[
-- 	set foldlevel=20
-- 	set foldmethod=expr
-- 	set foldexpr=nvim_treesitter#foldexpr()
-- ]])
--
-- cmd([[
-- 	setlocal foldmethod=syntax
-- 	setlocal foldlevelstart=99
-- ]])
