return {
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     transparent_background = true
  --
  --     vim.cmd.colorscheme 'catppuccin-mocha'
  --   end
  -- },
  {
    'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup({
        styles      = { comments = 'italic' },
        transparent = vim.g.transparent_enabled,
      })

      vim.cmd.colorscheme 'nightfox'
    end
  },
}
