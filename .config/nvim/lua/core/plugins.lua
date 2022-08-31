-- TODO
-- https://github.com/alpha2phi/neovim-for-beginner/blob/25-refactoring/lua/plugins.lua

-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
local packer_bootstrap = false

-- Clone packer repo on new system
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone --depth 1 https://github.com/wbthomason/packer.nvim" .. install_path)
	is_bootstrap = true
	packer_bootstrap = true
	vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")

if not status_ok then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Package manager
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("nvim-lua/popup.nvim")
	-- Is using a standard Neovim install, i.e. built from source or using a provided appimage.
	use("lewis6991/impatient.nvim") -- Optimiser
	use("wakatime/vim-wakatime")
	use("nvim-lualine/lualine.nvim") -- Fancier statusline
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("nvim-lua/lsp_extensions.nvim")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("tzachar/cmp-tabnine", { run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("simrat39/rust-tools.nvim") -- https://github.com/simrat39/rust-tools.nvim

	use("saadparwaiz1/cmp_luasnip")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	use("glepnir/lspsaga.nvim") -- LSP UIs
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	-- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim's built-in LSP client
	use("sbdchd/neoformat")
	use("wesleimp/stylua.nvim")
	use("ludovicchabant/vim-gutentags") -- Automatic tags management
	use("windwp/nvim-ts-autotag") -- Close tags for React apps
	use("windwp/nvim-autopairs") -- Close brackets
	use("norcalli/nvim-colorizer.lua")
	-- UI to select things (files, grep results, open buffers...)
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})
	use("nvim-telescope/telescope-file-browser.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use("kyazdani42/nvim-web-devicons") -- File icons
	-- NEOTREE
	-- Unless you are still migrating, remove the deprecated commands from v1.x
	-- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
	-- Press ? in the Neo-tree window to view the list of mappings.
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			-- Unless you are still migrating, remove the deprecated commands from v1.x
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
			-- If you want icons for diagnostic errors, you'll need to define them somewhere:
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
			-- NOTE: this is changed from v1.x, which used the old style of highlight groups
			-- in the form "LspDiagnosticsSignWarning"
		end,
	})

	use("folke/zen-mode.nvim")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("akinsho/nvim-bufferline.lua")
	use("dinhhuy258/git.nvim") -- For git blame & browse
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- Add git related info in the signs columns and popups
	use("tpope/vim-fugitive") -- Git commands in nvim
	use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
	use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines
	use("JoosepAlviste/nvim-ts-context-commentstring") --  Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
	use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines
	use({
		"Darazaki/indent-o-matic",
		event = "BufReadPost",
		config = function()
			require("indent-o-matic")
		end,
	}) -- Dumb automatic fast indentation detection for Neovim written in Lua
	use({
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	}) --  Escape from insert mode without delay when typing
	use({
		"folke/which-key.nvim",
		-- module = "which-key",
		-- config = function() require "configs.which-key" end,
	}) -- Keymaps popup

	use("mbbill/undotree") -- The undo history visualizer for VIM

	-- Colorscheme section
	use({ "svrana/neosolarized.nvim", requires = { "tjdevries/colorbuddy.nvim" } })
	use("mjlbach/onedark.nvim") -- Theme inspired by Atom
	use("gruvbox-community/gruvbox")
	use("folke/tokyonight.nvim")

	use("nvim-treesitter/playground")
	use("romgrk/nvim-treesitter-context")

	-- Debugging
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		packer.sync()
	end
end)

-- Do not execute rest of init.lua while bootstrapping config
-- Restart nvim
if is_bootstrap then
	print("=====================================")
	print(" Plugins are being installed         ")
	print(" Please wait until Packer completes, ")
	print(" Then restart nvim. Have Fun!        ")
	print("=====================================")
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})
