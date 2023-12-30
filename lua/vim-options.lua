vim.g.mapleader = ' '

vim.opt.autoread       = true
vim.opt.backspace      = '2'
vim.opt.colorcolumn    = '120'
vim.opt.laststatus     = 2
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.showcmd        = true
vim.opt.splitbelow     = true
vim.opt.splitright     = true

vim.opt.autoindent  = true
vim.opt.expandtab   = true
vim.opt.shiftround  = true
vim.opt.shiftwidth  = 2
vim.opt.smartindent = true
vim.opt.smarttab    = true
vim.opt.softtabstop = 2
vim.opt.tabstop     = 2

vim.opt.hlsearch   = true
vim.opt.ignorecase = true
vim.opt.incsearch  = true
vim.opt.smartcase  = true

vim.opt.list       = true
vim.opt.listchars  = 'tab:»»,trail:·'
vim.opt.signcolumn = 'yes'

-- Some LSP servers have issues with backup files and high updatetime
vim.opt.backup      = false
vim.opt.updatetime  = 300
vim.opt.writebackup = false
