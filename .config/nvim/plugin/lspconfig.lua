--vim.lsp.set_log_level("debug")
local status_ok_1, nvim_lsp = pcall(require, "lspconfig")
if not status_ok_1 then
	return
end

local protocol = require("vim.lsp.protocol")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

	-- aerial.nvim
	require("aerial").on_attach(client, bufnr)

	-- inlay-hints
	-- require("inlay-hints").on_attach(client, bufnr)
end

-- TODO
--[[ https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/after/plugin/lsp.lua ]]
--[[
	local function config(_config)
		return vim.tbl_deep_extend("force", {
			capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
			on_attach = function()
				nnoremap("gd", function() vim.lsp.buf.definition() end)
				nnoremap("K", function() vim.lsp.buf.hover() end)
				nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
				nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
				nnoremap("[d", function() vim.diagnostic.goto_next() end)
				nnoremap("]d", function() vim.diagnostic.goto_prev() end)
				nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
				nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
				nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
				inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
			end,
		}, _config or {})
	end
	
	require("lspconfig").svelte.setup(config())
	require("lspconfig").tsserver.setup(config())
	require("lspconfig").cssls.setup(config())
]]

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- https://github.com/alpha2phi/neovim-for-beginner/blob/58-lsp-inlay-hints/lua/config/lsp/init.lua
local capable_configs = vim.lsp.protocol.make_client_capabilities()
capable_configs.textDocument.completion.completionItem.snippetSupport = true
capable_configs.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
capable_configs.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}
local capabilities = require("cmp_nvim_lsp").update_capabilities(capable_configs) -- for nvim-cmp

nvim_lsp.flow.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
	-- FIXME https://alpha2phi.medium.com/neovim-for-beginners-lsp-inlay-hints-bf4a8afa6f27
	-- disable_formatting = true,
	settings = {
		javascript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
		typescript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
	},
})

nvim_lsp.sourcekit.setup({
	on_attach = on_attach,
})

nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				-- globals = { "vim" },
				globals = { "vim", "describe", "it", "before_each", "after_each", "packer_plugins" },
				-- disable = { "lowercase-global", "undefined-global", "unused-local", "unused-vararg", "trailing-space" },
			},
			hint = {
				enable = true,
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- FIXME new version
			runtime = {
				-- Tell language setver the Lua version being used
				version = "LuaJit",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			completion = { callSnippet = "Both" },
			telemetry = { enable = false },
		},
	},
})

--[[ https://github.com/alpha2phi/neovim-for-beginner/blob/58-lsp-inlay-hints/lua/config/lsp/init.lua ]]
nvim_lsp.gopls.setup({
	on_attach = on_attach,
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
})

nvim_lsp.tailwindcss.setup({})

nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
				allFeatures = true,
			},
			procMacro = {
				enable = true,
			},
			checkOnSave = {
				command = "clippy",
				extraArgs = { "--no-deps" },
			},
		},
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
