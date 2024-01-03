return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      sections = {
        lualine_x = { 'g:coc_status', 'encoding', 'fileformat', 'filetype' },
        lualine_y = { { 'datetime', style = '%a %b %d %I:%M:%S %p' } },
      },
    }
  end
}
