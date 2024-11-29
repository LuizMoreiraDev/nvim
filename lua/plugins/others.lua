return {
  { 'mg979/vim-visual-multi'  }, -- multiple cursors
  { 'tomtom/tcomment_vim'     }, -- easy comment/uncomment
  -- { 'tpope/vim-sensible'      },
  -- { 'tpope/vim-surround'      },
  -- { 'tpope/vim-endwise'       },
  { 'tpope/vim-rails'         },
  { 'slim-template/vim-slim'  }, -- slim syntax

  -- GIT
  { 'airblade/vim-gitgutter', dependencies = { 'tpope/vim-fugitive' } },
  {
    'tpope/vim-rhubarb',
    dependencies = { 'tpope/vim-fugitive' },
    config = function()
      vim.keymap.set('n', '<leader>gb', ':GBrowse<CR>')
      vim.keymap.set('n', '<leader>s',  ':Git status<CR>')
    end
  },

  { 'wakatime/vim-wakatime', lazy = false },
}
