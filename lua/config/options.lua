-- Leader key (must be set before plugins)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation (2 spaces for Ruby/Rails)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '120'
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.termguicolors = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Whitespace visibility
vim.opt.list = true
vim.opt.listchars = 'tab:»»,trail:·'

-- Misc
vim.opt.autoread = true
vim.opt.backspace = '2'
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300

-- Clipboard (system clipboard)
vim.opt.clipboard = 'unnamedplus'

-- Scroll offset
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
