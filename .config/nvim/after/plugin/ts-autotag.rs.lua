local status, autotag = pcall(require, 'nvim-ts-autotag' )

if (not status)then
  return
end

-- https://github.com/windwp/nvim-ts-autotag#override-default-values
autotag.setup({
  enable = true,
  filetypes = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'rust',
      'xml',
      'php',
      'markdown',
      'glimmer','handlebars','hbs'
  },
  skip_tags = {
    'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
    'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
  },
})

-- USAGE
-- Before        Input         After
-- ------------------------------------
-- <div           >              <div></div>
-- <div></div>    ciwspan<esc>   <span></span>
-- ------------------------------------
