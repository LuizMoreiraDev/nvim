return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require("neo-tree").setup({
      popup_border_style = "rounded",
      window             = {
        width = 70,
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
        },
      },
    })

    vim.keymap.set('n', '<leader>k', ':Neotree toggle float<CR>')
    vim.keymap.set('n', '<leader>n', ':Neotree toggle reveal float<CR>')
  end
}
