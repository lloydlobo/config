local status_ok, zenMode = pcall(require, "zen-mode")
if (not status_ok) then return end

zenMode.setup {
}

vim.keymap.set('n', '<C-w>o', '<cmd>ZenMode<cr>', { silent = true })


