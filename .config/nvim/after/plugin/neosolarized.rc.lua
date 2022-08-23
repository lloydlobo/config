-- https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/after/plugin/neosolarized.rc.lua 
local status, n = pcall(require, "neosolarized")

if (not status) then
  return
end

n.setup({
  comment_italics = true,
})


local cb = require('colorbuddy.init')
local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local groups = cb.groups
local styles = cb.styles

-- Color.new('black', '#073642')
Color.new('black', '#001e26')
Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)

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

-- TODO
-- [ ]
-- n.Group.new('TODO', n.colors.blue)
-- Group.new('TODO', colors.blue)

-- Neosolarized 
-- [[
--Color.new('base03', '#002b36')
--Color.new('base02', '#073642')
--Color.new('base01', '#586e75')
--Color.new('base00', '#657b83')
--Color.new('base0', '#839496')
--Color.new('base1', '#93a1a1')
--Color.new('base2', '#eee8d5')
--Color.new('base3', '#fdf6e3')
--Color.new('yellow', '#b58900')
--Color.new('orange', '#cb4b16')
--Color.new('red', '#dc322f')
--Color.new('magenta', '#d33682')
--Color.new('violet', '#6c71c4')
--Color.new('blue', '#268bd2')
--Color.new('cyan', '#2aa198')
--Color.new('green', '#719e07')
--
--Color.new('bg', colors.base03)
--Group.new('Error', colors.red)
--Group.new('Warning', colors.yellow)
--Group.new('Information', colors.blue)
--Group.new('Hint', colors.cyan)
--
--Group.new('Normal', colors.base0, colors.NONE, styles.NONE)
--Group.new('NormalNC', colors.base0:dark(), colors.NONE, styles.NONE)
--
-- ]]


-- Solarized Dark OG
--[[
--background #002b36
--foreground #839496
--cursor #708183
--selection_background #073642
--color0 #002731
--color8 #001e26
--color1 #d01b24
--color9 #bd3612
--color2 #728905
--color10 #465a61
--color3 #a57705
--color11 #52676f
--color4 #2075c7
--color12 #708183
--color5 #c61b6e
--color13 #5856b9
--color6 #259185
--color14 #81908f
--color7 #e9e2cb
--color15 #fcf4dc
--selection_foreground #93a1a1
--]]
