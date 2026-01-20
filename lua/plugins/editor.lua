return {
  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ['<Esc>'] = require('telescope.actions').close,
            },
          },
        },
      })

      telescope.load_extension('fzf')

      -- Helper for directory-scoped search
      local function find_in_dir(dir)
        return function()
          builtin.find_files({ search_dirs = { dir } })
        end
      end

      -- Core keymaps
      vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>r', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Buffers' })

      -- Rails directory shortcuts
      vim.keymap.set('n', '<leader>ja', find_in_dir('app'), { desc = 'Find in app/' })
      vim.keymap.set('n', '<leader>jl', find_in_dir('lib'), { desc = 'Find in lib/' })
      vim.keymap.set('n', '<leader>jc', find_in_dir('app/controllers'), { desc = 'Find in controllers' })
      vim.keymap.set('n', '<leader>jm', find_in_dir('app/models'), { desc = 'Find in models' })
      vim.keymap.set('n', '<leader>jv', find_in_dir('app/views'), { desc = 'Find in views' })
      vim.keymap.set('n', '<leader>js', find_in_dir('spec'), { desc = 'Find in spec/' })
    end,
  },

  -- File tree sidebar
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        view = { width = 35 },
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
      })
      vim.keymap.set('n', '<leader>k', ':NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
      vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>', { desc = 'Reveal file in tree' })
    end,
  },

  -- Seamless navigation between vim and tmux panes
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
    },
    keys = {
      { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Navigate left' },
      { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Navigate down' },
      { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Navigate up' },
      { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Navigate right' },
    },
  },
}
