for _, source in ipairs({
	"core.keymaps.keymaps",
	"core.keymaps.mappings",
	"core.keymaps.advanced",
	"core.keymaps.folds",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end

-- Source .vim file in lua/core/keymaps/ directory
-- vim.cmd("source ~/.config/nvim/lua/core/keymaps/functions.vim")
