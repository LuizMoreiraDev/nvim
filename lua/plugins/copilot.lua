return {
  'github/copilot.vim',
  config = function()
    vim.api.nvim_set_var('copilot_no_tab_map', true)
    vim.api.nvim_set_keymap('i', '<C-return>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
  end
}
