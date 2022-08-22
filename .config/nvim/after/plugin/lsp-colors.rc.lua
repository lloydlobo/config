local status, colors = pcall(require, 'lsp-colors')

if (not status) then
  return
end

colors.setup {
  Error = '#db4b4b',
  Warning = '#e0af68',
  Information = '#0db967',
  Hint = '#10b981',
}
