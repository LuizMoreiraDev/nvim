return {
  'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
  dependencies = { 'RRethy/nvim-treesitter-endwise' },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'lua', 'ruby', 'elixir', 'sql', 'html', 'css', 'scss', 'javascript' },
      highlight        = { enable = true },
      endwise          = { enable = true },
      indent           = { enable = false },
    }
  end
}
