return {
  { 'catppuccin/nvim', lazy = false, name = 'catppuccin', priority = 1000 }, -- lualine
  {
    'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup({
        styles = {
          comments = 'italic',
        },
      })

      vim.cmd.colorscheme 'nightfox'
    end,
  },
}
