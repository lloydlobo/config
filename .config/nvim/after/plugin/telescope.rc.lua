local status, telescope = pcall(require, 'telescope')

if (not status) then
  return
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      },
    },
  },
  extensions = {
  file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,                       -- disable netrw & use telescope-file-browser
      mappings = {
          -- your custom insert mode mappings
          ['i'] = {
            ['<C-w>'] = function ()
              vim.cmd('normal vbd')
            end,
          },

          ['n'] = {
          -- your custom normal mode mappings
            ['N'] = fb_actions.create,
            ['h'] = fb_actions.goto_parent_dir,
            ['/'] = function ()
              vim.cmd('startinsert')
            end,
          },
      },
    },
  },
}

telescope.load_extension('file_browser')

--
-- KEYMAPS
--
-- Find Files `;f`
vim.keymap.set('n', ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true,
    })
  end)
-- Live Grep `;r`
vim.keymap.set('n', ';r',
  function()
    builtin.live_grep()
  end)
-- Buffers `\\\\` => \ + \ (twice)
vim.keymap.set('n', '\\\\',
  function()
    builtin.buffers()
  end)
-- Tags Help `;t`
vim.keymap.set('n', ';t',
  function()
    builtin.help_tags()
  end)
-- Resume `;;` => Open the last telescope builtin buffer / extensions
vim.keymap.set('n', ';;',
  function()
    builtin.resume()
  end)
-- Diagnositcs `;e`
vim.keymap.set('n', ';e',
  function()
    builtin.diagnostics()
  end)

-- File Browser `sf`
vim.keymap.set('n', 'sf',
  function()
    telescope.extensions.file_browser.file_browser({
      path = '%:p:h',
      cwd = telescope_buffer_dir(),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      initial_mode = 'normal',
      layout_config = { height = 40 }            -- default height = 40
    })
  end)
