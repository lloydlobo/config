local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
	return
end

aerial.setup({
	-- https://github.com/AstroNvim/AstroNvim/blob/main/lua/configs/aerial.lua
	close_behavior = "global",
	backends = { "lsp", "treesitter", "markdown" },
	min_width = 28,
	show_guides = true,
	filter_kind = false,
	guides = {
		mid_item = "├ ",
		last_item = "└ ",
		nested_top = "│ ",
		whitespace = "  ",
	},

	on_attach = function(bufnr)
		-- Toggle the aerial window with <leader>a
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a", "<cmd>AerialToggle!<CR>", {})
		-- Jump forwards/backwards with '{' and '}'
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"{",
			"<cmd>AerialPrev<CR>",
			{ desc = "Jump backwards in Aerial" }
		)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"}",
			"<cmd>AerialNext<CR>",
			{ desc = "Jump forwards in Aerial" }
		)
		-- Jump up the tree with '[[' or ']]'
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"[[",
			"<cmd>AerialPrevUp<CR>",
			{ desc = "Jump up and backwards in Aerial" }
		)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"]]",
			"<cmd>AerialNextUp<CR>",
			{ desc = "Jump up and forwards in Aerial" }
		)
	end,
})
