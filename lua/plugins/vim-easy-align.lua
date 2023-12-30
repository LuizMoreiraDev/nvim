return {
  'junegunn/vim-easy-align',
  config = function()
    vim.keymap.set('c', 'ga', 'EasyAlign', {})
    vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', {})
  end
}
