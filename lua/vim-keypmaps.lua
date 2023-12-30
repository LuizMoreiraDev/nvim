-- B = kill current buffer
-- W = save current file
-- Q = kill current pane/window
vim.keymap.set('n', 'B', ':bd<CR>')
vim.keymap.set('n', 'W', ':w<CR>')
vim.keymap.set('n', 'Q', '<C-w>q<CR>')

-- edit/reload config
vim.keymap.set('n', '<leader>ev', ':vsplit ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>rv', ':source ~/.config/nvim/init.lua<CR>')

-- gets the current file path
vim.keymap.set('n', '<leader>cp', ':let @+ = expand("%")<CR>')

-- copy and paste
vim.keymap.set('v', 'y', '"+y')
vim.keymap.set('n', 'yy', '"+yy')

-- switch between the last two files
vim.keymap.set('n', '<leader><leader>', '<c-^>')

-- easy split
vim.keymap.set('n', 'ss', ':split<CR>')
vim.keymap.set('n', 'vv', ':vsplit<CR>')

-- shows the line/column
vim.keymap.set('n', 'cc', ':set cursorline! cursorcolumn!<CR>')

-- hides highlight search
vim.keymap.set('n', 'qq', ':nohlsearch<CR>')

-- easy move
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
