local status_ok, n = pcall(require, "neosolarized")
if not status_ok then
	return
end

n.setup({
	comment_italics = true,
})

vim.opt.termguicolors = true

local Color, colors, Group, groups, styles = require("colorbuddy").setup()

Color.new("background", "#002b36")
-- FIXME hack to fix notify transparent highlight color error alert. WIP
-- vim.cmd [[highlight Normal guibg=background]]
Color.new("background_color", "#002b36")
--[[devaslife]]
Color.new("black", "#002b36")
Group.new("CursorLine", colors.none, colors.base03, styles.NONE, colors.base1)
Group.new("CursorLineNr", colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new("Visual", colors.none, colors.base03, styles.reverse)
Group.new("Normal", colors.none, colors.base03, styles.NONE) -- Solves notify.nvim no highlight normal background group error

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/after/plugin/colorscheme.lua
-- Group.new("InjectedLanguage", nil, groups.Normal.bg:dark())

-- Use Color.new(<name>, <#rrggbb>) to create new colors
-- They can be accessed through colors.<name>
-- Color.new('background',  '#282c34')
--[[ 
	Color.new('red',         '#cc6666')
	Color.new('green',       '#99cc99')
	Color.new('yellow',      '#f0c674')
	-- Define highlights in terms of `colors` and `groups`
	Group.new('Function'        , colors.yellow      , colors.background , styles.bold)
	Group.new('luaFunctionCall' , groups.Function    , groups.Function   , groups.Function)
	-- Define highlights in relative terms of other colors
	Group.new('Error'           , colors.red:light() , nil               , s.bold)
	-- If you want multiple styles, just add them!
	Group.new('italicBoldFunction', colors.green, groups.Function, styles.bold + styles.italic)
	-- If you want the same style as a different group, but without a style: just subtract it!
	Group.new('boldFunction', colors.yellow, colors.background, groups.italicBoldFunction - styles.italic)
]]
