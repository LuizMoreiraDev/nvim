return {
  -- Git signs in gutter
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Git commands (:Git, :Git blame, etc)
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gvdiffsplit', 'Gread', 'Gwrite', 'Ggrep', 'GMove', 'GDelete', 'GBrowse' },
  },

  -- GitHub integration (:GBrowse)
  {
    'tpope/vim-rhubarb',
    dependencies = { 'tpope/vim-fugitive' },
    config = function()
      vim.keymap.set('n', '<leader>gb', ':GBrowse<CR>', { desc = 'Open in GitHub' })
    end,
  },
}
