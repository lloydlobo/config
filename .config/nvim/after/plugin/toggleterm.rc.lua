local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

-- https://github.com/akinsho/toggleterm.nvim
toggleterm.setup({
	-- size can be a number or function which is passed the current terminal
	--[[ size = 20 | function(term)
        if term.direction == "horizontal" then return 15
        elseif term.direction == "vertical" then return vim.o.columns * 0.4
        end
    end, ]]
	size = 10,
	open_mapping = [[<c-\>]],
	shading_factor = 2,
	direction = "float",
	auto_scroll = true,
	float_opts = {
		-- see :h nvim_open_win for details on borders however
		border = "curved",
		highlights = {
			border = "Normal",
			background = "Normal",
		},
		winblend = 0,
	},
	close_on_exit = true, -- close terminal when process exits
	shell = vim.o.shell,
	-- extra config
	persist_size = true,
	persist_mode = true,
	--  term: Terminal
	--[[ winbar = { enabled = false, name_formatter = function(term) return term.name end }, ]]
})
