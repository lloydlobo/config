for _, source in ipairs({
	"core.base",
	"core.autocmds",
	"core.keymaps",
	"core.highlights",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end

-- no need to load this immediately, since we have packer_compiled
vim.defer_fn(function()
	require("core.plugins")
end, 1000)

-- Source .vim file in lua/core/keymaps/ directory
vim.cmd("source ~/.config/nvim/lua/core/functions.vim")
vim.cmd("source ~/.config/nvim/lua/core/LargeFile.vim")

--[[ local augroup = vim.api.nvim_create_augroup
ThePrimeagenGroup = augroup("ThePrimeagen", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})
function R(name)
	require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufEnter", "BufWinEnter", "TabEnter" }, {
	group = ThePrimeagenGroup,
	pattern = "*.rs",
	callback = function()
		require("lsp_extensions").inlay_hints({})
	end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

]]
