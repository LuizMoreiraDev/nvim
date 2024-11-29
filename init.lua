local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require('vim-options')
require('lazy').setup('plugins')
require('vim-keypmaps')

vim.g.copilot_no_tab_map = true
vim.cmd('hi NeotreeNormal guibg=NONE ctermbg=NONE')
vim.cmd('let g:rails_projections = { "lib/samantha/samantha/*.rb": { "test": ["spec/samantha/{}_spec.rb"] }, "spec/samantha/*_spec.rb": { "alternate": ["lib/samantha/samantha/{}.rb"] }, "app/api/gotidy_api/*.rb": { "test": ["spec/api/{}_spec.rb"] }, "spec/api/*_spec.rb": { "alternate": ["app/api/gotidy_api/{}.rb"] } }')
