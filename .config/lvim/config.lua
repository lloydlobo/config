--[[
lvim is the global options object

Linters should be filled in as strings with either
a global executable or a path to an executable
]]

-- In my config I go with nanotee's advice and define a helper function
-- to avoid spelling out that insanely long function name.
-- https://stackoverflow.com/a/69142336
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- lvim.lang
-- Maximize window height on startup.
vim.cmd(t("normal <C-w>+"))
-- vim.cmd(let g:LanguageClient_useVirtualText = 0)
-- vim.cmd("normal hl-DiagnosticVirtualTextHint=0")
-- Show diagnostics in a pop-up window on hover
-- https://www.reddit.com/r/neovim/comments/uqb50c/with_native_lsp_nvimcmp_how_do_you_prevent_the/
_G.LspDiagnosticsPopupHandler = function()
    local current_cursor = vim.api.nvim_win_get_cursor(0)
    local last_popup_cursor = vim.w.lsp_diagnostics_last_cursor or { nil, nil }
    -- Show the popup diagnostics window,
    -- but only once for the current cursor location (unless moved afterwards).
    if not (current_cursor[1] == last_popup_cursor[1] and current_cursor[2] == last_popup_cursor[2]) then
        vim.w.lsp_diagnostics_last_cursor = current_cursor
        vim.diagnostic.open_float(0, { scope = "cursor" })
    end
    local reset_group = vim.api.nvim_create_augroup('reset_group', {})
    vim.api.nvim_create_autocmd({ 'CursorHold' }, {
        callback = function()
            _G.LspDiagnosticsPopupHandler()
        end,
        group = reset_group,
    })
end
vim.cmd [[
augroup LSPDiagnosticsOnHover
  autocmd!
  autocmd CursorHold *   lua _G.LspDiagnosticsPopupHandler()
augroup END
]]
-- general
lvim.log.level = "warn"
lvim.format_on_save = false

-- External program to use for "=" command.
-- autocmd FileType c,cpp setlocal equalprg=clang-format
-- format <CMD>gg=G<CR> -- Explanation: gg goes to the top of the file, = is a command to fix the indentation and G tells it to perform the operation to the end of the file.

-- lvim.colorscheme = "tokyonight-night"
-- lvim.colorscheme = "catppuccin"
-- lvim.colorscheme = "one_monokai"
-- lvim.colorscheme = "onenord"
-- lvim.colorscheme = "gruvbox"
lvim.colorscheme = "kanagawa"
-- lvim.colorscheme = "solarized"
-- lvim.colorscheme = "cobalt2"
-- lvim.colorscheme = "NeoSolarized"

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- q ➜  /\. ^Ma^M * ^[
lvim.keys.normal_mode["<C-i>"] = "/\\. <S-a><CR> * <C-[>"

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

--[[utils]]

function Set_default_option_settings()
    local default_options = {
        -- indents will have width of 4.
        shiftwidth = 4, -- the number of spaces inserted for each indentation
        tabstop = 4, -- insert 2 spaces for a tab
        softtabstop = 4, -- number of columns fro a tab.
        relativenumber = true, -- set relative numbered lines
        numberwidth = 2, -- set number column width to 2 {default 4} -- Thus with the Vim default of 4 there is room for a line number up to 999. When the buffer has 1000 lines five columns will be used. The minimum value is 1, the maximum value is 20.
        wrap = false, -- display lines as one long line
    }
    for k, v in pairs(default_options) do
        vim.opt[k] = v -- print("defaults", k, "is", v)
    end
end

Set_default_option_settings()

--[[ Every wrapped line will continue visually indented (same amount of space 
    as the beginning of that line), thus preserving horizontal blocks of text. ]]
-- Enable break indent.
vim.o.breakindent = true
-- Set highlight on search. This will remove the highlight after searching for text.
vim.o.hlsearch = false

-- https://alpha2phi.medium.com/neovim-for-beginners-code-folding-7574925412ea
vim.opt.foldlevel = 20
-- vim.opt.foldmethod = "expr"
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Increment/decrement
lvim.keys.normal_mode["+"] = "<C-a>"
lvim.keys.normal_mode["-"] = "<C-x>"

-- Default delete word backwards
lvim.keys.normal_mode["dw"] = 'vb"_d'

-- Vim tweaks
-- goto start/end of line in insert mode
lvim.keys.insert_mode["<C-d>"] = "<C-o>0" -- Ctrl-d go start (down)
lvim.keys.insert_mode["<C-f>"] = "<C-o>$" -- Ctrl-f go end (front)


--  https://github.com/0xsamrath/.dotfiles/blob/main/nvim/lua/keymaps/init.lua
-- surrounding with parantheses -- Highlight in VISUAL MODE!!! wrap
lvim.keys.visual_mode["<leader>'"] = "<esc>`>a'<esc>`<i'<esc>"
lvim.keys.visual_mode['<leader>"'] = '<esc>`>a"<esc>`<i"<esc>'
lvim.keys.visual_mode['<leader>`'] = '<esc>`>a`<esc>`<i`<esc>'
lvim.keys.visual_mode["<leader>("] = "<esc>`>a)<esc>`<i(<esc>"
lvim.keys.visual_mode["<leader>["] = "<esc>`>a]<esc>`<i[<esc>"
lvim.keys.visual_mode["<leader>{"] = "<esc>`>a}<esc>`<i{<esc>"

-- Select all
-- lvim.keys.normal_mode["<leader><C-a>"] = "gg<S-v>G"
lvim.builtin.which_key.mappings["<C-a>"] = {
    name = "+Text",
    a = { "gg<S-v>G", "Select All Text" },
    v = { "gg<S-v>GY", "Copy All Text" },
    w = { "<cmd>set wrap<cr>", "Word Wrap Enable" },
    n = { "<cmd>set nowrap<cr>", "Word Wrap Disable" },
    i = { "gg=G<C-o>", "Vim Indent" },
    s = {
        function()
            vim.o.spell = not vim.o.spell
            print("spell: " .. tostring(vim.o.spell))
        end,
        "Toggle spell check" -- https://www.reddit.com/r/neovim/comments/ua544z/how_do_i_toggle_and_read_spell_using_lua/
    }
}

lvim.builtin.which_key.mappings["m"] = {
    name = "+MiniMap",
    c = { "<cmd>lua MiniMap.close<cr>", "Close MiniMap" },
    o = { "<cmd>lua MiniMap.open<cr>", "Close MiniMap" },
    -- vim.keymap.set('n', '<Leader>mc', MiniMap.close)
    -- vim.keymap.set('n', '<Leader>mf', MiniMap.toggle_focus)
    -- vim.keymap.set('n', '<Leader>mo', MiniMap.open)
    -- vim.keymap.set('n', '<Leader>mr', MiniMap.refresh)
    -- vim.keymap.set('n', '<Leader>ms', MiniMap.toggle_side)
    -- vim.keymap.set('n', '<Leader>mt', MiniMap.toggle)
}

lvim.builtin.which_key.mappings["z"] = {
    name = "+Zen",
    i = { "<cmd>IndentBlanklineToggle<cr>", "Toggle IndentBlankLine Guides" },
    m = { "<C-w>+", "Maximize Window Height" },
    w = { function()
        require("zen-mode").toggle({ window = { width = .85 } })
    end, "Toggle zen with width 85% width" },
    -- s = { function() vim.opt.listchars:append "space:⋅" end, "Toggle space dot" },
    c = {
        name = "+IndentListChars",
        d = { function() vim.opt.listchars:append "space:⋅" end, "Enable space char dot" },
        s = { function() vim.opt.listchars:append "space: " end, "Disable space char blank" },
        e = { function() vim.opt.listchars:append "eol:↴" end, "Enable char blank end of line" },
        n = { function() vim.opt.listchars:append "eol: " end, "Disable char blank end of line" },
    },
    z = { "<Esc><cmd>ZenMode<cr>", "Toggle Zen Mode" },
}

-- [[       SETUP          ]]
-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- lvim.keys.visual_mode["k"] = "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- lvim.keys.visual_mode["j"] = "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }
lvim.keys.visual_mode["x"] = '"_x' -- deletes forward chars

-- remove the L and Q commands
lvim.keys.visual_mode["L"] = "<Nop>"
lvim.keys.visual_mode["Q"] = "<Nop>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
    -- for input mode
    i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
    },
    -- for normal mode
    n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
    },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true -- NOTE Use <C-\>>C-n> to get in normal_mode in terminal (neovim feature)
lvim.builtin.nvimtree.setup.view.width = 30
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "go",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
    "sumeko_lua",
    "jsonls",
}
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--   uninstall_server = "d",
--   toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    -- { command = "black", filetypes = { "python" } },
    -- { command = "isort", filetypes = { "python" } },
    { command = "isort", filetypes = { "python" } },
    {
        -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "prettier",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--print-with", "100" },
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "typescript", "typescriptreact" },
    },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "flake8", filetypes = { "python" } },
    {
        -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "shellcheck",
        ---@usage arguments to pass to the formatter
        -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--severity", "warning" },
    },
    {
        command = "codespell",
        ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
        filetypes = { "javascript", "python" },
    },
}
-- Additional Plugins

lvim.plugins = {
    { "lunarvim/colorschemes" },
    { "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
            require("catppuccin").setup()
            -- vim.api.nvim_command "colorscheme catppuccin"
        end
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {}
        end
    },
    { "folke/tokyonight.nvim" }, -- { "sainhe/everforest" },
    { "Tsuzat/NeoSolarized.nvim" }, --  NeoSolarized colorscheme for NeoVim with full transparency
    { 'lalitmee/cobalt2.nvim', requires = 'tjdevries/colorbuddy.nvim' },
    { -- https://github.com/maxmx03/solarized.nvim
        'maxmx03/solarized.nvim',
        -- config = function()
        --     local success, solarized = pcall(require, 'solarized')
        --     if not success then return end
        --     solarized.setup()
        -- end
    },
    { "rebelot/kanagawa.nvim" },
    { "cpea2506/one_monokai.nvim" },
    {
        "nvim-orgmode/orgmode",
        config = function()
            require("orgmode").setup {}
        end
    },
    {
        'RishabhRD/popfix',
        'RishabhRD/nvim-cheat.sh'
    }, -- https://github.com/RishabhRD/nvim-cheat.sh
    {
        'echasnovski/mini.nvim',
        config = function()
            require("mini.map").setup()
        end
    },
    {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                keywords = {
                    FIX = {
                        icon = " ", -- icon used for the sign, and in search results
                        color = "error", -- can be a hex color, or a named color (see below)
                        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                        -- signs = false, -- configure signs for some keywords individually
                    },
                    TODO = { icon = " ", color = "info" },
                    HACK = { icon = " ", color = "warning" },
                    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
                },
            }
        end
    },
    -- indent highlighting { "Yggdroot/indentLine" },
    -- show character on end of lines
    { "lukas-reineke/indent-blankline.nvim" },
    -- "morhetz/gruvbox"
    -- { "morhetz/gruvbox" },
    { "ellisonleao/gruvbox.nvim" },
    -- Colorful CSV highlighting
    { "mechatroner/rainbow_csv" },
    -- Keybindings for navigating between vim and tmux
    { "christoomey/vim-tmux-navigator" },
    -- get some nicer UI around lsp issues
    { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
    -- Run tests from vim
    { "vim-test/vim-test" },
    -- use("airblade/vim-gitgutter")
    -- Markdown preview
    { "iamcco/markdown-preview.nvim", run = "cd app & yarn install", cmd = "MarkdownPreview" },
    -- Debug Go
    { "sebdah/vim-delve" },
    -- formatter to format on save
    -- { "mhartington/formatter.nvim" },
    -- dev tools
    { 'tpope/vim-dispatch', ft = { 'cpp', 'c', 'fortran' }, cmd = { 'Make' } },
    { 'lervag/vimtex', ft = { 'tex' } },
    -- find and search
    { "junegunn/fzf", run = ":call fzf#install()" },
    { 'junegunn/vim-easy-align' },
    -- use 'terryma/vim-multiple-cursors',
    { 'majutsushi/tagbar', cmd = { 'TagbarToggle' } },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-surround' },
    { 'tpope/vim-repeat' },
    { 'mhinz/vim-grepper' },
}


local function opt_blankline()
    vim.opt.list = true
    vim.opt.listchars:append "space: "
    -- vim.opt.listchars:append "space:⋅"
    vim.opt.listchars:append "eol: "
    -- vim.opt.listchars:append "eol:↴"
    vim.opt.termguicolors = true
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
end

local function blankline_simple()
    opt_blankline()
    require("indent_blankline").setup { -- char = "", -- this erases all indent guides.
        show_trailing_blankline_indent = false,
        show_end_of_line = true,
        show_current_context = true,
        show_current_context_start = true,
        -- char = "⋅",
        char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
            "IndentBlanklineIndent3",
            "IndentBlanklineIndent4",
            "IndentBlanklineIndent5",
            "IndentBlanklineIndent6",
        },
        space_char_blankline = "↴", -- space_char_blankline = " ",
        space_char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
            "IndentBlanklineIndent3",
            "IndentBlanklineIndent4",
            "IndentBlanklineIndent5",
            "IndentBlanklineIndent6",
        },
    }
end

blankline_simple()

-- -------------------------------------------------------------
-- ORG-MODE
-- -------------------------------------------------------------

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require 'nvim-treesitter.configs'.setup {
    -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' }, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
    },
    ensure_installed = { 'org' }, -- Or run :TSUpdate org
}

require('orgmode').setup({
    org_agenda_files = { '~/Dropbox/org/*', '~/my-orgs/**/*' },
    org_default_notes_file = '~/Dropbox/org/refile.org',
})

-- -------------------------------------------------------------
-- ORG-MODE
-- -------------------------------------------------------------

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.json", "*.jsonc" },
    -- enable wrap mode for json files only
    command = "setlocal wrap",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "zsh",
    callback = function()
        -- let treesitter use bash highlight for zsh files as well
        require("nvim-treesitter.highlight").attach(0, "bash")
    end,
})

local theme_NeoSolarized = {
    NeoSolarized_italics = 1, -- 0 or 1
    NeoSolarized_visibility = 'high', -- low, normal, high
    NeoSolarized_diffmode = 'low', -- low, normal, high
    NeoSolarized_termtrans = 1, -- 0(default) or 1 -> Transparency
    NeoSolarized_lineNr = 0, -- 0 or 1 (default) -> To Show backgroung in LineNr
}

---@diagnostic disable-next-line: unused-function, unused-local
local function theme_NeoSolarized_cmd()
    for key, value in pairs(theme_NeoSolarized) do
        vim.g[key] = value
        -- print("defaults", k, "is", v)
    end

    vim.cmd [[
    try
        colorscheme NeoSolarized
    catch /^Vim\%((\a\+)\)\=:E18/
        colorscheme default
        set background=dark
    endtry
        highlight FloatBorder guibg=NONE ctermbg=NONE  " Removes the border of float menu (LSP and Autocompletion uses it)
        highlight link NormalFloat Normal 
        highlight NormalFloat ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE 
        highlight Pmenu ctermbg=NONE guibg=NONE 
    ]]

end

theme_NeoSolarized_cmd()

---@diagnostic disable-next-line: unused-function, unused-local
local function theme_one_monokai()
    require("one_monokai").setup({
        transparent = true,
    })
end

theme_one_monokai()

-- THEME Solarized.
local success, solarized = pcall(require, 'solarized')
if not success then
    return
end
local solarized_config = {
    mode = 'dark', -- dark(default)/light
    theme = 'neovim', -- vim(default)/neovim/vscode
    transparent = false, -- false(default)/true } ,),
    -- colors = function(c)
    --     local colors = {
    --         -- fg = c.cyan, -- override the default foreground color
    --         indigo = '#4B0082', -- new color
    --     }
    --     return colors
    -- end,
    highlights = function(colors)
        local highlights = {
            LineNr = { bg = colors.bg, }, -- Line bg is window bg.
            -- CmpItemKindTabnine = { fg = colors.magenta },
            -- CmpItemKindEmoji = { fg = colors.yellow },
            -- LineNr = { bg = solarized:is_transparent(colors.bg_alt) }, -- bg_alt if solarized is not transparent
            -- CursorLineNr = { fg = colors.fg }, -- new color being used
        }
        return highlights
    end,
}
solarized.setup(solarized_config)

-- local latte = require("catppuccin.palettes").get_palette "latte"
local frappe = require("catppuccin.palettes").get_palette "frappe"
local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local mocha = require("catppuccin.palettes").get_palette "mocha"
vim.g.catppuccin_flavour = "mocha" -- Has to be set in order for empty argument to work
local colors = require("catppuccin.palettes").get_palette() -- g:catppuccin_flavour's palette
-- latte, frappe, macchiato, mocha
require("catppuccin").setup({
    transparent_background = true,
    term_colors = true,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true, -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
    custom_highlights = {
        Comment = { fg = colors.flamingo },
        TSConstBuiltin = { fg = colors.peach, style = {} },
        TSConstant = { fg = colors.sky },
        TSComment = { fg = colors.surface2, style = { "italic" } }
    },
    color_overrides = {},
    highlight_overrides = {
        all = {
            CmpBorder = { fg = "#3e4145" },
        },
        -- latte = {
        --     Normal = { fg = ucolors.darken(latte.base, 0.7, latte.mantle) }, -- BUG: ucolors undefined..
        -- },
        frappe = {
            TSConstBuiltin = { fg = frappe.peach, style = {} },
            TSConstant = { fg = frappe.sky },
            TSComment = { fg = frappe.surface2, style = { "italic" } },
        },
        macchiato = {
            LineNr = { fg = macchiato.overlay1 }
        },
        mocha = {
            Comment = { fg = mocha.flamingo },
        },
    },
})
