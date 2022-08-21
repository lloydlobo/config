-- https://blog.inkdrop.app/my-neovim-setup-for-react-typescript-tailwind-css-etc-in-2022-a7405862c9a4
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

-- stylua: ignore start
packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Telescope
  use 'nvim-lua/plenary.nvim'                -- Common utilities
  use 'nvim-telescope/telescope.nvim'        -- Find, Filter, Preview, Pick. All lua, all the time.
  use "nvim-telescope/telescope-file-browser.nvim"  -- File Browser extension for telescope.nvim
  use 'BurntSushi/ripgrep'                   -- telescope dep required for live_grep and grep_string
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }                                          -- FZF sorter for telescope written in c
  use {
    'nvim-treesitter/nvim-treesitter',      -- Treesitter configurations and abstraction layer for Neovim
     run = ':TSUpdate',
  }
  use 'sharkdp/fd'
  -- LSP
  use 'jose-elias-alvarez/null-ls.nvim'      -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  use 'L3MON4D3/LuaSnip'                     -- LSP Engine for cmp - snippet
  use 'onsails/lspkind-nvim'                 --  vscode-like pictograms for neovim lsp completion items
  use 'hrsh7th/cmp-buffer'                   -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'                 -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'                     -- Completion
  use 'neovim/nvim-lspconfig'                -- LSP
  use 'MunifTanjim/prettier.nvim'             -- Prettier plugin for Neovim's built-in LSP client
  use 'williamboman/mason.nvim'               -- Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters
  use 'williamboman/mason-lspconfig.nvim'     -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
  use 'glepnir/lspsaga.nvim'                  -- A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI
  -- THEME
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use {
    'nvim-lualine/lualine.nvim',              -- Statusline
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }                                         -- lua `fork` of vim-web-devicons for neovim
  }
  use 'tjdevries/colorbuddy.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'windwp/nvim-autopairs'                 -- Autopairs
  use 'windwp/nvim-ts-autotag'                -- Use treesitter to auto close and auto rename html tag
  use 'norcalli/nvim-colorizer.lua'           -- A high-performance color highlighter
  use 'akinsho/nvim-bufferline.lua'           -- A snazzy bufferline
  use 'lewis6991/gitsigns.nvim'               -- Git integration for buffers
  use 'dinhhuy258/git.nvim'                   -- A simple clone of the plugin vim-fugitive
  use 'iamcco/markdown-preview.nvim'          -- Markdown live preview
  use 'folke/zen-mode.nvim'                   -- Distraction-free mode
  -- use {'kevinhwang91/nvim-hclipboard'}

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
  if packer_bootstrap then
    packer.sync()
  end
end)
-- stylua: ignore end

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
