--
-- https://github.com/hrsh7th/nvim-cmp
--

 local status, cmp = pcall(require, 'cmp')

 if (not status) then
   return
 end

 local lspkind = require 'lspkind'

 cmp.setup({
    snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
    },                                      -- https://blog.inkdrop.app/my-neovim-setup-for-react-typescript-tailwind-css-etc-in-2022-a7405862c9a4
    mapping = cmp.mapping.preset.insert({
        -- Credits: https://github.com/nguyenvukhang/dots/blob/main/nvim/.config/nvim/lua/brew/plugins/nvim-cmp.lua
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),

        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),

        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),                                  -- <CR> Alt + M or Enter (Return key) Carriage Return maybe..?
    }),
    formatting = {
        format = lspkind.cmp_format({
            with_text = false,
            maxwidth = 50,
            menu = {
                buffer = '[buf]',
                nvim_lsp = '[LSP]',
                path = '[path]',
            }
        }),
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer', keywors_length = 5 },
    }),
    expermental = {
        -- ghost_text_view = true,
        ghost_text = true,
    },
})

 vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
 ]]

-- Credit https://github.com/nguyenvukhang/dots/blob/main/nvim/.config/nvim/lua/brew/plugins/nvim-cmp.lua
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', { sources = { { name = 'buffer' } } })

-- " Use <Tab> and <S-Tab> to navigate through popup menu
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
