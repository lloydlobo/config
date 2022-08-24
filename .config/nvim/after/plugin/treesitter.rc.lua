-- nvim-treesitter enables syntax highlight
local status_ok, ts = pcall(require, 'nvim-treesitter.configs')
local status_ok_2, ts_parsers = pcall(require, 'nvim-treesitter.parsers')

if (not status_ok) then
    return
end

ts.setup {
    ensure_installed = {
        'tsx',
        'toml',
        'fish',
        'bash',
        'rust',
        'json',
        'svelte',
        'yaml',
        'css',
        'html',
        'lua'
    },
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            -- TODO: I'm not sure for this one.
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,                    -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
    },
    context_commentstring = {
        enable = true,
    },
    move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
        },
        goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
        },
        goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
        },
        goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
        },
    },
    swap = {
        enable = true,
        swap_next = {
            ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
            ['<leader>A'] = '@parameter.inner',
        },
    },
    autotag = {
        enable = true,
    },
}

-- TELESCOPE also has this, so does lspsaga
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

if (not status_ok_2) then 
    return 
end

ts_parsers.get_parser_configs().tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }

-- local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
