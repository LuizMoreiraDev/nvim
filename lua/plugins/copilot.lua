return {
  'github/copilot.vim',
  config = function()
    -- vim.api.nvim_set_keymap('i', '<A-return>', 'copilot#Accept("<CR>")', { expr = true, silent = true })

    vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false
    })
    vim.g.copilot_no_tab_map = true

  end
}
