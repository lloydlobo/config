local status, mason = pcall(require, 'mason')

if (not status) then
  return
end


local status_2, lspconfig = pcall(require, 'mason-lspconfig')


if (not status_2) then
  return
end

mason.setup({
  -- add setup
})

lspconfig.setup {
  ensure_installed = { 'sumneko_lua', 'tailwindcss' },
}
