if vim.g.neovide then
	local g = vim.g
	local o = vim.o

	g.neovide_cursor_trail_length = 0
	g.neovide_cursor_animation_length = 0
	g.neovide_transparency = 0.8
	g.neovide_floating_blur_amount_x = 2.0
	g.neovide_floating_blur_amount_y = 2.0
	g.neovide_fullsceen = true
	g.neovide_confirm_quit = true
	-- g.neovide_profiler = true -- shows a frametime graph in the upper left corner
	-- o.guifont = "Jetbrains Mono Nerd Font"
	-- https://neovide.dev/faq.html#how-can-i-dynamically-change-the-font-size-at-runtime
	vim.g.gui_font_default_size = 10
	vim.g.gui_font_size = vim.g.gui_font_default_size
	vim.g.gui_font_face = "Fira Code Nerd Font"

	-- TODO Adjust font size in neovim
	--[[ RefreshGuiFont = function()
	vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
	end
	ResizeGuiFont = function(delta)
		vim.g.gui_font_size = vim.g.gui_font_size + delta
		RefreshGuiFont()
	end
	ResetGuiFont = function()
		vim.g.gui_font_size = vim.g.gui_font_default_size
		RefreshGuiFont()
	end
	-- Call function on startup to set default value
	ResetGuiFont()
	-- Keymaps
	local opts = { noremap = true, silent = true }
	vim.keymap.set({ "n", "i" }, "<C-+>", function()
		ResizeGuiFont(1)
	end, opts)
	vim.keymap.set({ "n", "i" }, "<C-->", function()
		ResizeGuiFont(-1)
	end, opts) ]]
end
