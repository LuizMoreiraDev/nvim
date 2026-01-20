local map = vim.keymap.set

-- Buffer/Window management
map('n', 'B', ':bd<CR>', { desc = 'Close buffer' })
map('n', 'W', ':w<CR>', { desc = 'Save file' })
map('n', 'Q', '<C-w>q', { desc = 'Close pane' })

-- Copy path to clipboard
map('n', '<leader>cp', ':let @+ = expand("%:.")<CR>', { desc = 'Copy relative path' })

-- Clipboard (system)
map('v', 'y', '"+y', { desc = 'Yank to system clipboard' })
map('n', 'yy', '"+yy', { desc = 'Yank line to system clipboard' })

-- Switch between last two files
map('n', '<leader><leader>', '<C-^>', { desc = 'Alternate file' })

-- Easy splits
map('n', 'ss', ':split<CR>', { desc = 'Horizontal split' })
map('n', 'vv', ':vsplit<CR>', { desc = 'Vertical split' })

-- Toggle cursor line/column highlight
map('n', 'cc', ':set cursorline! cursorcolumn!<CR>', { desc = 'Toggle cursor guides' })

-- Clear search highlight
map('n', 'qq', ':nohlsearch<CR>', { desc = 'Clear search highlight' })

-- Navigate between panes (will be enhanced by vim-tmux-navigator)
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left pane' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom pane' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to top pane' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right pane' })
