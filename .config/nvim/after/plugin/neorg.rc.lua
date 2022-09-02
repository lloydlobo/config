-- https://github.com/nvim-neorg/neorg
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/after/plugin/neorg.lua
if not pcall(require, "neorg") then
	return
end

require("neorg").setup({
	-- Tell Neorg what modules to load
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.norg.concealer"] = {
			config = {
				conceals = false,
			},
		}, -- Allows for use of icons
		["core.norg.dirman"] = { -- Manage your directories with Neorg
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
					-- teej = "~/teej",
				},
			},
		},
	},
})

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
	install_info = {
		url = "https://github.com/vhyrro/tree-sitter-norg",
		files = { "src/parser.c" },
		branch = "main",
	},
}
