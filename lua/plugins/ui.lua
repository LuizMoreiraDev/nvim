return {
  -- Colorscheme
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      require('nightfox').setup({
        options = {
          styles = { comments = 'italic' },
          transparent = vim.g.transparent_enabled,
        },
      })
      vim.cmd.colorscheme('nightfox')
    end,
  },

  -- Icons (with fallback when Nerd Font not available)
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
    opts = {
      default = true,
      strict = true,
    },
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'nightfox',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },

  -- Transparent background toggle
  {
    'xiyaowong/transparent.nvim',
    lazy = false,
    opts = {},
  },
}
