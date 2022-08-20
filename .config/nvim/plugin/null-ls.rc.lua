-- https://github.com/jose-elias-alvarez/null-ls.nvim
--
-- https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/plugin/null-ls.rc.lua

local status, null_ls = pcall(require, 'null-ls')
if (not status) then
  return
end

local augroup_format = vim.api.nvim_create_augroup('Format', { clear = true })

null_ls.setup {
  sources = {
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md#diagnostics_format-string
  -- yay eslint_d
  null_ls.builtins.diagnostics.eslint_d.with({
    diagnostics_format = '[eslint] #{m}\n(#{c})'
  }),                                           -- Injects actions to fix ESLint issues or ignore broken rules. Like ESLint, but faster.
  null_ls.builtins.diagnostics.fish             -- Basic linting is available for fish scripts using fish --no-execute.
},
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md#on_attach-function-optional
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md#should_attach-function-optional
  on_attach = function(client, bufnr)           -- yes its bufnr and NOT buffer here
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds {
        buffer = 0,
        group = augroup_format,
      }
      vim.api.nvim_create_autocmd( 'BufWritePre', {
        group = augroup_format,
        buffer = 0,
        callback = function() vim.lsp.buf.formatting_seq_sync() end
      })
    end
  end,

}

-- ----------------------------------------------------------------------------

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics
--
-- Vim: Add this to your .vimrc to lint the current buffer or visual selection on <leader>f:
-- " Autofix entire buffer with eslint_d:
-- nnoremap <leader>f mF:%!eslint_d --stdin --fix-to-stdout<CR>`F
-- " Autofix visual selection with eslint_d:
-- vnoremap <leader>f :!eslint_d --stdin --fix-to-stdout<CR>gv

-- Moar speed
  -- If you're really into performance and want the lowest possible latency, talk to the eslint_d server with netcat. This will also eliminate the node.js startup time.
  -- 
  -- You first need to extract the port and access token from the .eslint_d file. The location of this file may change depending on your system (see above). For example, if XDG_RUNTIME_DIR is specified, you can do this:
  -- 
  -- $ PORT=`cat $XDG_RUNTIME_DIR/.eslint_d | cut -d" " -f1`
  -- $ TOKEN=`cat $XDG_RUNTIME_DIR/.eslint_d | cut -d" " -f2`
  -- Then, you can do the following to run eslint on file.js:
  -- 
  -- $ echo "$TOKEN $PWD file.js" | nc localhost $PORT
  -- Or if you want to work with stdin:
  -- 
  -- $ echo "$TOKEN $PWD --stdin" | cat - file.js | nc localhost $PORT
  -- This runs eslint in under 50ms!
  -- 
  -- Tip For additional speed, did you know that you can lint only files that have changed? This is a feature of normal eslint, but it also works from eslint_d. Run:
  -- 
  -- $ eslint_d . --cache
