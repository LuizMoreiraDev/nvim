return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      direction       = 'float',
      float_opts      = { border = 'curved' },
      open_mapping    = [[<c-\>]],
      shade_terminals = false,
      size            = vim.o.lines * 0.4,
    }
  end
}
