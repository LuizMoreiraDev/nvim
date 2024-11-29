return {
  {
    'xiyaowong/transparent.nvim',
    config = function()
      vim.g.transparent_enabled = true

      require('transparent').setup({
        extra_groups   = { 'lualine' },
        exclude_groups = { 'CursorLine' },
      })
    end
  }
}
