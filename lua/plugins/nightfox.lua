return {
  'EdenEast/nightfox.nvim',
  config = function()
    require('nightfox').setup({
      styles      = { comments = 'italic' },
      transparent = vim.g.transparent_enabled,
    })

    vim.cmd.colorscheme 'nightfox'
  end,
}
