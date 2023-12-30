return {
  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').setup({
        extra_groups   = { 'lualine' },
        exclude_groups = { 'CursorLine' },
      })
    end
  }
}
