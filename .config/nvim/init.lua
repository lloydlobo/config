-- https://github.com/krady21/dotfiles/blob/master/.config/nvim/init.vim
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
 
--
-- Install packer
--
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim' .. install_path)
	vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'tpope/vim-fugitiv'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'mjbach/onedark.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'tpope/vim-sleuth'
	use { 'nvim-telescope/telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

	-- Fuzzy Finder Algorithm requires local dependencies
	-- Load if "make" is available
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fnexecutable "make" == 1 }
	
	if is_bootstrap then
		require('packer').sync()
	end
end)
-- stylua: ignore end

--
-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end
