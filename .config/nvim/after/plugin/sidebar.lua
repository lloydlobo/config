local status_ok, sidebar = pcall(require, 'sidebar-nvim')
if (not status_ok) then
  return
end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

sidebar.setup({
  open = true,
  initial_width = 40,
  sections = { "files", "datetime", "symbols", "git" },
})

map("n", "<leader>n", ":SidebarNvimFocus<CR>", opts)

