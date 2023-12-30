return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzy-native.nvim' },
    config = function()
      local telescope = require('telescope')
      local builtin   = require('telescope.builtin')

      telescope.setup {
        defaults = {
          mappings = {
            i = {
              ['<esc>'] = require('telescope.actions').close,
            },
          },
        },
      }

      telescope.load_extension('fzy_native')

      vim.keymap.set('n', '<leader>p', builtin.find_files, {})
      vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>b', builtin.buffers, {})
      vim.cmd('nnoremap <Leader>ja :Telescope find_files search_dirs=["./app"]<CR>')
      vim.cmd('nnoremap <Leader>jl :Telescope find_files search_dirs=["./lib"]<CR>')
      vim.cmd('nnoremap <Leader>jm :Telescope find_files search_dirs=["./app/models"]<CR>')
      vim.cmd('nnoremap <Leader>js :Telescope find_files search_dirs=["./spec"]<CR>')
    end
  },
  -- {
  --   'nvim-telescope/telescope-ui-select.nvim',
  --   config = function()
  --     require('telescope').setup {
  --       extensions = {
  --         ['ui-select'] = { require('telescope.themes').get_dropdown {} }
  --       }
  --     }
  --     require('telescope').load_extension('ui-select')
  --   end
  -- },
}
