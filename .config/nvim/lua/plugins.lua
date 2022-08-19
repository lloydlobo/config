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
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  -- use 'nvim-lualine/lualine.nvim'           -- Statusline
  -- use 'windwp/nvim-autopairs'
  -- use 'windwp/nvim-ts-autotag'
  -- use 'norcalli/nvim-colorizer.lua'
  -- use 'folke/zen-mode.nvim'
  -- use 'akinsho/nvim-bufferline.lua'
  -- use 'lewis6991/gitsigns.nvim'
  -- use 'dinhhuy/git.nvim'                    -- For git blame & browse

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
