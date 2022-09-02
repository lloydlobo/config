-- https://github.com/rcarriga/nvim-notify/tree/master/lua/notify/stages
if not pcall(require, "plenary") then
	return
end

local log = require("plenary.log").new({
	plugin = "notify",
	level = "debug",
	use_console = false,
})
-- These examples assume that you have set nvim-notify as your vim.notify handler
vim.notify = function(msg, level, opts)
	log.info(msg, level, opts)
	require("notify")(msg, level, opts)

	-- You can also use plenary's async library to avoid using callbacks:
	--[[ local async = require("plenary.async")
local notify = require("notify").async ]]
	--[[ Viewing History If you have telescope.nvim installed then you can use the notify extension to search the history: 
  :Telescope notify ]]
	-- see `:Notifications`
	-- require("telescope").extensions.notify.notify(opts)

	--[[ -- You can get a list of past notifications with the history function
	-- require("notify").history() ]]
end


vim.cmd [[highlight Normal guibg=NONE]]
-- https://github.com/rcarriga/nvim-notify/issues/16 -- [[ NotifyLOGIcon NotifyLOGTitle NotifyLOGBorder NotifyLOGBody ]] [[NotifyLOGIcon16 xxx links to NotifyLOGIcon NotifyLOGTitle16 xxx links to NotifyLOGTitle NotifyLOGBorder16 xxx links to NotifyLOGBorder NotifyLOGBody16 xxx links to NotifyLOGBody]]
-- --[[ TODO]] Add background_color
-- require("notify").setup({ background_color = "#002b33" })

--[[ There are a number of custom options that can be supplied in a table as the third argument. See :h NotifyOptions for details.
https://github.com/rcarriga/nvim-notify#usage ]]
-- local plugin = "My Awesome Plugin"
--[[ async.run(function()
	notify("Let's wait for this to close").events.close()
	notify("It closed!")
end) ]]

-- Set a custom filetype to take advantage of treesitter highlighting:
-- local text = "Sample notify text"
--[[ vim.notify(text, "info", {
	title = "My Awesome Plugin",
	on_open = function(win)
		local buf = vim.api.nvim_win_get_buf(win)
		vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
	end,
}) ]]

--[[ vim.notify("This is an error message.\nSomething went wrong!", "error", {
	title = plugin,
	on_open = function()
		vim.notify("Attempting recovery.", vim.log.levels.WARN, {
			title = plugin,
		})
		local timer = vim.loop.new_timer()
		timer:start(2000, 0, function()
			vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
				title = plugin,
				timeout = 3000,
				on_close = function()
					vim.notify("Problem solved", nil, { title = plugin })
					vim.notify("Error code 0x0395AF", 1, { title = plugin })
				end,
			})
		end)
	end,
}) ]]
