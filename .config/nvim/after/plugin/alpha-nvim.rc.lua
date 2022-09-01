local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
local function header()
	return {
		"                                        ▟▙            ",
		"                                        ▝▘            ",
		"██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖",
		"██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██",
		"██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██",
		"██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██",
		"▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀",
		"",
	}
end

dashboard.section.header.val = header()

dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
	-- Number of plugins
	local total_plugins = #vim.tbl_keys(packer_plugins)
	local datetime = os.date("%d-%m-%Y %H:%M:%S")
	local plugins_text = "   "
		.. total_plugins
		.. " plugins"
		.. "   v"
		.. vim.version().major
		.. "."
		.. vim.version().minor
		.. "."
		.. vim.version().patch
		.. "   "
		.. datetime

	-- Quote
	local fortune = require("alpha.fortune")
	local quote = table.concat(fortune(), "\n")

	return plugins_text .. "\n" .. quote
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Constant"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Function"
dashboard.section.buttons.opts.hl_shortcut = "Type"
dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)

-- https://github.com/alpha2phi/neovim-for-beginner/blob/25-refactoring/lua/config/alpha.lua
-- https://github.com/glepnir/dashboard-nvim/wiki/Header-Preview
-- https://github.com/xflea/nv-dashboard-header-maker
-- https://xflea.github.io/nv-dashboard-header-maker/

-- return {
-- 	[[                                           bbbbbbbb            ]],
-- 	[[                                           b::::::b            ]],
-- 	[[                                           b::::::b            ]],
-- 	[[                                           b::::::b            ]],
-- 	[[                                            b:::::b            ]],
-- 	[[nnnn  nnnnnnnn    vvvvvvv           vvvvvvv b:::::bbbbbbbbb    ]],
-- 	[[n:::nn::::::::nn   v:::::v         v:::::v  b::::::::::::::bb  ]],
-- 	[[n::::::::::::::nn   v:::::v       v:::::v   b::::::::::::::::b ]],
-- 	[[nn:::::::::::::::n   v:::::v     v:::::v    b:::::bbbbb:::::::b]],
-- 	[[  n:::::nnnn:::::n    v:::::v   v:::::v     b:::::b    b::::::b]],
-- 	[[  n::::n    n::::n     v:::::v v:::::v      b:::::b     b:::::b]],
-- 	[[  n::::n    n::::n      v:::::v:::::v       b:::::b     b:::::b]],
-- 	[[  n::::n    n::::n       v:::::::::v        b:::::b     b:::::b]],
-- 	[[  n::::n    n::::n        v:::::::v         b:::::bbbbbb::::::b]],
-- 	[[  n::::n    n::::n         v:::::v          b::::::::::::::::b ]],
-- 	[[  n::::n    n::::n          v:::v           b:::::::::::::::b  ]],
-- 	[[  nnnnnn    nnnnnn           vvv            bbbbbbbbbbbbbbbb   ]],
-- }

--[[ let g:startify_custom_header =
       \ startify#pad(split(system('figlet -w 100 VIM2020'), '\n')) ]]
-- https://gist.github.com/shaggyrogers/2c928108d1fa87ab4462fad9be99ebec
