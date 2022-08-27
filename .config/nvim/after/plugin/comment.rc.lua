local status_ok_1, comment = pcall(require, "Comment")
if (not status_ok_1) then return end
local status_ok_2, ft = pcall(require, "Comment.ft")
if (not status_ok_2) then return end

-- [[ DEFAULT CONFIG ]]
comment.setup({
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
        ---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
        extended = true,
    },

    ---Function to call before (un)comment
    -- pre_hook = nil,
    -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#commentnvim
    -- 1. Disabled `CursorHold in treesitter.rc.lua`
    -- 2. Then, configure Comment.nvim to trigger the commentstring updating logic with its pre_hook configuration:
    pre_hook = require(
        'ts_context_commentstring.integrations.comment_nvim'
    ).create_pre_hook(),

    ---Function to call after (un)comment
    post_hook = nil,
})

-- [[ FILETYPES + LANGUAGES ]]
-- 1. Using set function
ft
 -- Set only line comment
 .set('yaml', '#%s')
 -- Or set both line and block commentstring
 .set('javascript', {'//%s', '/*%s*/'})

-- 2. Metatable magic
ft.javascript = {'//%s', '/*%s*/'}
ft.yaml = '#%s'

-- Multiple filetypes
ft({'go', 'rust'}, {'//%s', '/*%s*/'})
ft({'toml', 'graphql'}, '#%s')

-- 3. Get the whole set of commentstring
ft.lang('lua') -- { '--%s', '--[[%s]]' }
ft.lang('javascript') -- { '//%s', '/*%s*/' }

-- [[ EXTENDED MAPPINGS ]]
--[[
-- https://github.com/numToStr/Comment.nvim

These mappings are disabled by default. (config: mappings.extended)

    NORMAL mode

`g>[count]{motion}` - (Op-pending) Comments the region using linewise comment
`g>c` - Comments the current line using linewise comment
`g>b` - Comments the current line using blockwise comment
`g<[count]{motion}` - (Op-pending) Uncomments the region using linewise comment
`g<c` - Uncomments the current line using linewise comment
`g<b`- Uncomments the current line using blockwise comment

    VISUAL mode

`g>` - Comments the region using single line
`g<` - Unomments the region using single line

Examples

# Linewise

`gcw` - Toggle from the current cursor position to the next word
`gc$` - Toggle from the current cursor position to the end of line
`gc}` - Toggle until the next blank line
`gc5j` - Toggle 5 lines after the current cursor position
`gc8k` - Toggle 8 lines before the current cursor position
`gcip` - Toggle inside of paragraph
`gca}` - Toggle around curly brackets

# Blockwise

`gb2}` - Toggle until the 2 next blank line
`gbaf` - Toggle comment aro

und a function (w/ LSP/treesitter support)
`gbac` - Toggle comment around a class (w/ LSP/treesitter support) ]]
