local status, packer = pcall(require, 'packer')

-- You can also use the following command (with packer bootstrapped) to have packer setup your configuration (or simply run updates) and close once all operations are completed:
-- $ nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

-- Install packer
local fn = vim.fn
local is_bootstrap = false
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  -- vim.fn.execute('!git clone --depth 1 https://github.com/wbthomason/packer.nvim' .. install_path)
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  is_bootstrap = true
  vim.cmd [[packadd packer.nvim]]
end

if (not status) then
  print('Packer is not installed')
  return
end

vim.cmd [[packadd packer.nvim]]

-- -- stylua: ignore start
packer.startup(function(use)
    -- Plugin manager
    use 'wbthomason/packer.nvim'

    -- Optimiser
    use 'lewis6991/impatient.nvim'          --  Improve startup time for Neovim 

    -- Lua Functions
    use 'nvim-lua/plenary.nvim'             -- Common utilities

    -- Package Manager
    use 'williamboman/mason.nvim'           -- Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters

    use({
        "WhoIsSethDaniel/mason-tool-installer.nvim",
         after = "mason.nvim",
         -- TODO
         -- config = function() require "mason-tool-installer" end,
    })

    -- Built-in LSP
    use 'neovim/nvim-lspconfig'                                                     -- Collection of configurations for built-in LSP client
    use 'williamboman/nvim-lsp-installer'   -- Automatically install language servers to stdpath
    use 'jose-elias-alvarez/null-ls.nvim'   -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    -- TODO Delete this?
    use 'williamboman/mason-lspconfig.nvim' -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim

    -- LSP symbols
    use({
        "stevearc/aerial.nvim",
        -- module = "aerial",
        cmd = { "AerialToggle", "AerialOpen", "AerialInfo" },
        -- config = function() require "configs.aerial" end,
    })

    -- Indent detection
    use({
        "Darazaki/indent-o-matic",
        event = "BufReadPost",
        config = function() require "indent-o-matic" end,
    })

    -- Cursorhold fix
    use({
        'antoinemadec/FixCursorHold.nvim',
        config = function()
            vim.g.cursorhold_updatetime = 100
        end,
        event = { 'BufRead', 'BufNewFile' },
      })

    -- Terminal
    use({
        'akinsho/toggleterm.nvim',
        cmd = "ToggleTerm",
        -- TODO
        -- module = { "toggleterm", "toggleterm.terminal" },
        config = function () require('toggleterm').setup() end,
    })

    -- Smooth scrolling
    use { 'declancm/cinnamon.nvim', event = { 'BufRead', 'BufNewFile' }, }

    -- Smooth escaping
    use({
        "max397574/better-escape.nvim",
        event = "InsertCharPre",
        config = function() require "better_escape" end,
    })

    -- Comment ==> "gc" to comment visual regions/lines
    use({
        'numToStr/Comment.nvim',
        config = function () require('Comment').setup() end,
        keys = { "gc", "gb", "g<", "g>" },
        -- TODO
        -- config = function() require "toggleterm" end,
    })

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',        -- Find, Filter, Preview, Pick. All lua, all the time.
        requires = {
          'nvim-lua/plenary.nvim',
          'nvim-lua/popup.nvim',
        },
    })
    use "nvim-telescope/telescope-file-browser.nvim"  -- File Browser extension for telescope.nvim

    -- File explorer
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        -- module = "neo-tree",
        cmd = "Neotree",
        requires = { { "MunifTanjim/nui.nvim", module = "nui" } },
        setup = function() vim.g.neo_tree_remove_legacy_commands = true end,
        config = function() require("neo-tree") end,
    })

    use({
        "feline-nvim/feline.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- use("sidebar-nvim/sidebar.nvim")
    use({
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function() end,
    })                                        -- tabline plugin with re-orderable, auto-sizing, clickable tabs, icons, nice highlighting, sort-by commands and a magic jump-to-buffer mode.
    use({
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    })
    use({
        "VonHeikemen/fine-cmdline.nvim",
        requires = {
          { "MunifTanjim/nui.nvim" },
        },
    })
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
    }                                          -- FZF sorter for telescope written in c
    use 'BurntSushi/ripgrep'                   -- telescope dep required for live_grep and grep_string

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',      -- Treesitter configurations and abstraction layer for Neovim
         run = ':TSUpdate',
         event = { "BufRead", "BufNewFile" },
         cmd = {
           "TSInstall",
           "TSInstallInfo",
           "TSInstallSync",
           "TSUninstall",
           "TSUpdate",
           "TSUpdateSync",
           "TSDisableAll",
           "TSEnableAll",
         },
         -- config = function() require "nvim-treesitter" end,
    }

    use 'nvim-treesitter/nvim-treesitter-textobjects'                               -- Additional textobjects for treesitter
    use 'sharkdp/fd'                           -- nvim-treesitter dependency find replacement

    -- Snippet collection
    use({ "rafamadriz/friendly-snippets", opt = true , })

    -- Snippet engine
    use({
        "L3MON4D3/LuaSnip",
        -- module = "luasnip",
        wants = "friendly-snippets",
        -- TODO
        -- config = function() require("luasnip") end,
    })                                         -- LSP Engine for cmp - snippet
    -- Snippet completion source
    use({
        "saadparwaiz1/cmp_luasnip",
        after = "nvim-cmp",
        -- TODO
        -- config = function() vim.add_user_cmp_source "luasnip" end,
    })
    use 'onsails/lspkind.nvim'                 -- vscode-like pictograms for neovim lsp completion items

    use 'hrsh7th/nvim-cmp'                     -- Completion

    -- Buffer completion source
    use({
        -- use 'hrsh7th/cmp-buffer'                   -- nvim-cmp source for buffer words
        "hrsh7th/cmp-buffer",
        after = "nvim-cmp",
        -- TODO
        -- config = function() astronvim.add_user_cmp_source "buffer" end,
    })

    -- Path completion source
    use({ "hrsh7th/cmp-path", after = "nvim-cmp",
        -- TODO
        -- config = function() astronvim.add_user_cmp_source "path" end,
    })

    -- LSP completion source
    -- use 'hrsh7th/cmp-nvim-lsp'                 -- nvim-cmp source for neovim's built-in LSP
    use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp",
        -- TODO
        -- config = function() astronvim.add_user_cmp_source "nvim_lsp" end,
    })

    use 'glepnir/lspsaga.nvim'                 -- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI
    use 'glepnir/dashboard-nvim'               -- Vim Dashboard - async start screen

    -- indent | formatting
    use 'MunifTanjim/prettier.nvim'            -- Prettier plugin for Neovim's built-in LSP client
    use 'lukas-reineke/indent-blankline.nvim'                                       -- Add indentation guides even on blank lines

    -- Git related plugins
    use 'lewis6991/gitsigns.nvim'               -- Git integration for buffers
    use 'dinhhuy258/git.nvim'                   -- A simple clone of the plugin vim-fugitive
    use 'kdheepak/lazygit.nvim'
    use("APZelos/blamer.nvim")

    -- THEME
    use {
      'svrana/neosolarized.nvim',
      requires = { 'tjdevries/colorbuddy.nvim' }
    }

    use 'kyazdani42/nvim-web-devicons'

    use {
      'nvim-lualine/lualine.nvim',              -- Statusline
      requires = {
        'kyazdani42/nvim-web-devicons',
        opt = true
      }                                         -- lua `fork` of vim-web-devicons for neovim
    }
    -- Parenthesis highlighting
    use({
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
    })
    -- Autoclose tags
    use({
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter",
    })                                           -- Use treesitter to auto close and auto rename html tag
    -- Context based commenting
    use({
        "JoosepAlviste/nvim-ts-context-commentstring",
        after = "nvim-treesitter",
    })

    -- Better buffer closing
    use({
        'famiu/bufdelete.nvim',
        cmd = { 'Bdelete', 'Bwipeout' },
    })
    --  use ({ 's1n7ax/nvim-window-picker',
    --      config = function () require('nvim-window-picker').setup() end,
    --      -- tag = 'v1.*', module = 'window-picker',
    --  })

    use 'akinsho/nvim-bufferline.lua'           -- A snazzy bufferline
    use 'norcalli/nvim-colorizer.lua'           -- A high-performance color highlighter
    use "Pocco81/true-zen.nvim"                 -- Clean and elegant distraction-free writing for NeoVim
    use 'folke/zen-mode.nvim'                   -- Distraction-free mode
    use 'folke/twilight.nvim'                   -- Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing.
    use 'folke/lsp-colors.nvim'                 -- Plugin that creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin LSP client.
    use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    })                                          -- Markdown live preview
    use {'kevinhwang91/nvim-hclipboard'}

    -- Notification Enhancer
    use 'nvim-lua/popup.nvim'                   -- Popup API
    use({
        "rcarriga/nvim-notify",
        event = "VimEnter",
        -- TODO
        -- config = function() require "nvim-notify" end,
    })
     -- Productivity
    use("vimwiki/vimwiki")

    -- Extras(but imporant)
    use 'windwp/nvim-autopairs'                -- Autopairs
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    })
    use("andweeb/presence.nvim")
    use("NvChad/nvim-base16.lua")
    use "folke/which-key.nvim"              -- Keymaps popup

    -- Neovim UI Enhancer
    use({
        'stevearc/dressing.nvim',
        event = 'VimEnter',
        config = function ()
            require('dressing')
        end

    })

    -- tpope plugins
    -- use 'tpope/vim-fugitive'                 -- same as dinhhuy258/git.nvim
    -- use 'tpope/vim-rhubarb'                     -- rhubarb.vim: GitHub extension for fugitive.vim

    -- Smarter Splits
    -- use({
    --     'mrjones2014/smart-splits.nvim',
    --     config = function () require('smart-splits').setup() end,
    -- })

    -- Colorschemes
    -- use("folke/tokyonight.nvim")
    -- use("ful1e5/onedark.nvim")
    -- use("rmehri01/onenord.nvim")
    -- use({ "eddyekofo94/gruvbox-flat.nvim", branch = "local" })


-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
  if packer_bootstrap then
    packer.sync()
  end
end)
-- -- stylua: ignore end

-- You can configure Packer to use a floating window for command outputs by passing a utility function to packer's config:
-- packer.startup({function()
--   -- Your plugins here
-- end,
-- config = {
--   display = {
--     open_fn = require('packer.util').float,
--   }
-- }})

-- require('hclipboard'.start()

-- Do not execute rest of init.lua while vootstrapping config
-- Restart nvim
if is_bootstrap then
  print '====================================='
  print ' Plugins are being installed         '
  print ' Please wait until Packer completes, '
  print ' Then restart nvim. Have Fun!        '
  print '====================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- You can configure Neovim to automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
-- augroup packer_user_config
--   autocmd!
--   autocmd BufWritePost plugins.lua source <afile> | PackerCompile
-- augroup end
  -- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
-- https://blog.inkdrop.app/my-neovim-setup-for-react-typescript-tailwind-css-etc-in-2022-a7405862c9a4
-- https://github.com/folke/dot/blob/master/config/nvim/lua/plugins.lua
-- TODO https://github.com/0xsamrath/.dotfiles/tree/main/nvim/lua/plugins
-- https://github.com/AstroNvim/AstroNvim/blob/main/lua/core/plugins.lua
