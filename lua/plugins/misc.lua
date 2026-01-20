return {
  -- Multiple cursors
  {
    'mg979/vim-visual-multi',
    event = 'VeryLazy',
    -- Default keymaps:
    -- Ctrl+n: select word under cursor, then next occurrence
    -- Ctrl+Down/Up: create cursors vertically
    -- n/N: get next/prev occurrence
    -- q: skip current and get next
  },

  -- Comment/uncomment
  {
    'tomtom/tcomment_vim',
    event = 'VeryLazy',
    -- Default keymaps:
    -- gcc: toggle comment current line
    -- gc{motion}: toggle comment with motion
    -- gc in visual: toggle comment selection
  },

  -- Align text
  {
    'junegunn/vim-easy-align',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', { desc = 'Easy align' })
      vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', { desc = 'Easy align' })
    end,
  },

  -- Auto-format on save
  {
    'mhartington/formatter.nvim',
    event = 'VeryLazy',
    config = function()
      require('formatter').setup({
        filetype = {
          ruby = {
            function()
              return {
                exe = 'rubocop',
                args = { '--autocorrect', '--stdin', vim.fn.expand('%:p'), '--stderr' },
                stdin = true,
              }
            end,
          },
        },
      })

      -- Format on save (silently, no errors on failure)
      vim.api.nvim_create_autocmd('BufWritePost', {
        pattern = { '*.rb' },
        callback = function()
          pcall(vim.cmd, 'FormatWrite')
        end,
      })
    end,
  },

  -- Time tracking
  {
    'wakatime/vim-wakatime',
    lazy = false,
  },
}
