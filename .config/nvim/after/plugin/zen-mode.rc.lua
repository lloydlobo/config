if not pcall(require, "zen-mode") then
	return
end

require("zen-mode").setup({
	window = {
		-- backdrop = 0.999,
		backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
		height = 0.9,
		width = 140,
		options = {
			number = false,
			relativenumber = false,
		},
	},
	plugins = {
		kitty = {
			enabled = true,
			font = "+4", -- font size increment
		},
		twilight = {
			enabled = false,
		}
	},
})

vim.keymap.set("n", "<C-w>o", "<cmd>ZenMode<cr>", { silent = true })

-- https://github.com/folke/twilight.nvim
require("twilight").setup({
	dimming = {
		alpha = 0.25, -- amount of dimming
		-- we try to get the foreground from the highlight groups or fallback color
		color = { "Normal", "#ffffff" },
		inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
	},
	-- context = -1, -- amount of lines we will try to show around the current line
	context = 10, -- amount of lines we will try to show around the current line
	treesitter = true, -- use treesitter when available for the filetype
	-- treesitter is used to automatically expand the visible text,
	-- but you can further control the types of nodes that should always be fully expanded
	expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
		"function",
		"method",
		"table",
		"if_statement",
	},
	exclude = {}, -- exclude these filetypes
})
