local status_ok_1, cmp = pcall(require, "cmp")
if not status_ok_1 then
	return
end

local status_ok_2, lspkind = pcall(require, "lspkind")
if not status_ok_2 then
	return
end

local source_mapping = {
	youtube = "[YT]",
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- Credits: https://github.com/nguyenvukhang/dots/blob/main/nvim/.config/nvim/lua/brew/plugins/nvim-cmp.lua
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}),
	sources = cmp.config.sources({
		{ name = "cmp_tabnine" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "luasnip" },
		{ name = "orgmode" },
	}),
	--[[ formatting = {
		format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
		-- https://github.com/wesleimp/stylua.nvim
		-- :lua require("stylua").format()
	}, ]]
	-- hover says it imports this from null-ls
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. " " .. menu
				end
				vim_item.kind = ""
			end
			vim_item.menu = menu
			return vim_item
		end,
	},
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])

-- " Use <Tab> and <S-Tab> to navigate through popup menu
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
