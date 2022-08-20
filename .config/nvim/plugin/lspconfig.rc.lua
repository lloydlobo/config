local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attatch = function(client, buffer)

  -- Formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.apt.nvim_command [[augroup Format]]
    vim.apt.nvim_command [[autocmd! * <buffer>]]
    vim.apt.nvim_command [[autocmd BufWritePre <buffer> lua nvim.lsp.buf.formatting_seq_sync()]]
    vim.apt.nvim_command [[augroup end]]
  end
end
