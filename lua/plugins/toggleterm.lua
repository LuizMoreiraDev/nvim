return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup {
        direction       = 'float',
        open_mapping    = [[<c-\>]],
        shade_terminals = false,
        size            = 20, --vim.o.lines * 0.4,
        float_opts      = {
          border = 'double',
          width  = math.ceil(vim.o.columns * 0.75),
          height = math.ceil(vim.o.lines * 0.75),
        },
      }
    end
  }
}
