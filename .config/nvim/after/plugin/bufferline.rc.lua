local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = 'tabs',                               -- buffer gets crowded
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
  },
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    background = {
      fg = '#657b83',
      bg = '#002b36',
    },
    buffer_selected = {
      fg = '#657b83',
      bold = true,
    },
    fill = {
      bg = '#073642',
    },
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferlineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

-- guifg -> fg
-- guibg -> bg
-- guisp -> sp
-- gui -> underline = true, undercurl = true, italic = true
-- see `:help bufferline-highlights`