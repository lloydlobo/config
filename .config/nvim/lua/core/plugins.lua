-- Install packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

local is_bootstrap = false
local packer_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone --depth 1 https://github.com/wbthomason/packer.nvim' .. install_path)
    is_bootstrap = true
    packer_bootstrap = true
    vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, 'packer')

if (not status_ok) then
  print('Packer is not installed')
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager
    use { "svrana/neosolarized.nvim", requires = { "tjdevries/colorbuddy.nvim" } }
    -- use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
    use 'nvim-lualine/lualine.nvim' -- Fancier statusline
    use "nvim-lua/plenary.nvim" -- Common utilities
    use "onsails/lspkind-nvim" -- vscode-like pictograms
    use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'
    -- Additional textobjects for treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'ludovicchabant/vim-gutentags' -- Automatic tags management
    use "windwp/nvim-ts-autotag"        -- Close tags for React apps
    use "windwp/nvim-autopairs"        -- Close brackets
    use 'kyazdani42/nvim-web-devicons' -- File icons
    -- UI to select things (files, grep results, open buffers...)
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'nvim-telescope/telescope-file-browser.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use "norcalli/nvim-colorizer.lua"
    use 'folke/zen-mode.nvim'
    use 'akinsho/nvim-bufferline.lua'
    use 'glepnir/lspsaga.nvim' -- LSP UIs
    use 'dinhhuy258/git.nvim' -- For git blame & browse

    use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    -- Add indentation guides even on blank lines
    use 'lukas-reineke/indent-blankline.nvim'
    -- Add git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
  if packer_bootstrap then
    packer.sync()
  end
end)

-- Do not execute rest of init.lua while bootstrapping config
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
