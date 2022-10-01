--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight-night"
-- lvim.colorscheme = "one_monokai"
-- lvim.colorscheme = "NeoSolarized" -- enable the theme_NeoSolarized_cmd() at end of file too

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
        shiftwidth = 4, -- the number of spaces inserted for each indentation
        tabstop = 4, -- insert 2 spaces for a tab
        relativenumber = true, -- set relative numbered lines
        numberwidth = 2, -- set number column width to 2 {default 4} -- Thus with the Vim default of 4 there is room for a line number up to 999. When the buffer has 1000 lines five columns will be used. The minimum value is 1, the maximum value is 20.
        wrap = false, -- display lines as one long line
    }

    for k, v in pairs(default_options) do
        vim.opt[k] = v
        -- print("defaults", k, "is", v)
    end
end

Set_default_option_settings()

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
    -- f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    -- d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    -- q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    -- l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    -- w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- <Esc>l<Cmd>lua require('nvim-autopairs.fastwrap').show()<CR>
-- require("zen-mode").toggle({ window = { width = .85 -- width will be 85% of the editor width } })
lvim.builtin.which_key.mappings["z"] = {
    name = "+Zen",
    m = { "<C-w>+", "Maximize Window Height" },
    z = { "<Esc><cmd>ZenMode<cr>", "Toggle Zen Mode"
    },
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
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

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
    { "folke/tokyonight.nvim" },
    { "Tsuzat/NeoSolarized.nvim" }, --  NeoSolarized colorscheme for NeoVim with full transparency
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
}
-- TODO: dh

--[[ nvim-cheat.sh 
-- :Cheat
-- :Cheat cpp reverse number
-- :CheatWithoutComments
-- :CheatWithoutComments cpp reverse number

Keymaps for prompt are:
    -- In insert mode:
    <CR> : Open result in default layout.      <C-x> : Open result in horizontal split.
    <C-t> : Open result in a new tab.          <C-v> : Open result in a vertical split.
    <C-y> : Open result in floating window.    <C-f> : Open result in floating window.
    <C-c> : Close window without any action.   <C-p> : Previous in history
    <C-n> : Next in history

    -- In normal mode:
    <CR> : Open result in default layout.      <C-x> : Open result in horizontal split.
    <C-t> : Open result in a new tab.          <C-v> : Open result in a vertical split.
    <C-y> : Open result in floating window.    <C-f> : Open result in floating window.
    <C-c> : Close window without any action.   <Esc> : Close window without any action.
    q : Close window without any action.        
    k : Previous in history j : Next in history 
]]

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

-- FIXME
-- Install nvim-cmp, and buffer source as a dependency
-- {
--   "hrsh7th/nvim-cmp",
--   config = function()
--     if lvim.builtin.cmp then
--       require("lvim.core.cmp").setup()
--     end
--   end,
--   requires = {
--     "L3MON4D3/LuaSnip",
--   },
-- },
-- require('nvim-cmp').setup({
--     sources = {
--         { name = 'orgmode' }
--     }
-- })
-- sources = cmp.config.sources({
--       { name = 'nvim_lsp' },
--       { name = 'vsnip' }, -- For vsnip users.
--       -- { name = 'luasnip' }, -- For luasnip users.
--       -- { name = 'ultisnips' }, -- For ultisnips users.
--       -- { name = 'snippy' }, -- For snippy users.
--     }, {
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
    NeoSolarized_visibility = 'normal', -- low, normal, high
    NeoSolarized_diffmode = 'normal', -- low, normal, high
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

-- theme_NeoSolarized_cmd()

---@diagnostic disable-next-line: unused-function, unused-local
local function theme_one_monokai()
    require("one_monokai").setup({
        transparent = true,
    })
end

theme_one_monokai()

-- TODO
--[[
--  Is there a way to interact with bare git repos, say for a dotfiles repo? #1201 
-- https://github.com/jesseduffield/lazygit/discussions/1201
local Terminal = require'toggleterm.terminal'.Terminal

local function close_terminal_on_zero_exit(terminal, _, exit_code)
    if exit_code == 0 then
        terminal:close()
    end
end

local lazygit = Terminal:new({
    cmd = 'lazygit',
    direction = 'float',
    hidden = true,
    on_exit = close_terminal_on_zero_exit,
})

local dotfileslazygit = Terminal:new({
    cmd = 'lazygit --git-dir=$HOME/.cfg --work-tree=$HOME',
    direction = 'float',
    hidden = true,
    on_exit = close_terminal_on_zero_exit,
})

wk.register({
    G = { function()
        if vim.loop.cwd() == vim.call('expand', '~/.config') then
            dotfileslazygit:toggle()
        else
            lazygit:toggle()
        end
    end , 'lazygit'},
}, { prefix = 'g' })
]]
