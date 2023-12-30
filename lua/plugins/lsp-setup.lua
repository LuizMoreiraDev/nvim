return {
  {
    'neoclide/coc.nvim', build = 'yarn install --frozen-lockfile',
    config = function()
      vim.g.coc_global_extensions = { 'coc-solargraph' }

      local keyset = vim.keymap.set
      -- Autocomplete
      function _G.check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
      end

      -- Use Tab for trigger completion with characters ahead and navigate
      -- NOTE: There's always a completion item selected by default, you may want to enable
      -- no select by setting `'suggest.noselect': true` in your configuration file
      -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
      -- other plugins before putting this into your config
      local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
      keyset('i', '<TAB>', "coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? '<TAB>' : coc#refresh()", opts)
      keyset('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : '\<C-h>']], opts)

      -- Use <c-j> to trigger snippets
      keyset('i', '<c-j>', '<Plug>(coc-snippets-expand-jump)')
      -- Use <c-space> to trigger completion
      keyset('i', '<c-space>', 'coc#refresh()', {silent = true, expr = true})

      -- Use `[g` and `]g` to navigate diagnostics
      -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
      keyset('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
      keyset('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})

      -- GoTo code navigation
      keyset('n', 'gd', '<Plug>(coc-definition)', {silent = true})
      -- keyset('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
      -- keyset('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
      keyset('n', 'gr', '<Plug>(coc-references)', {silent = true})

      -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
      -- vim.api.nvim_create_augroup('CocGroup', {})
      -- vim.api.nvim_create_autocmd('CursorHold', {
      --     group = 'CocGroup',
      --     command = "silent call CocActionAsync('highlight')",
      --     desc = 'Highlight symbol under cursor on CursorHold'
      -- })
    end
  },

  -- ANOTHER LSP CLIENTS
  -- {
  --   'neovim/nvim-lspconfig',
  --   dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
  --   config = function()
  --     require('mason').setup()
  --
  --     require('mason-lspconfig').setup {
  --       ensure_installed = { 'solargraph' }
  --     }
  --
  --     require('lspconfig').solargraph.setup({})
  --
  --     -- vim.api.nvim_create_autocmd('LspAttach', {
  --     --   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  --     --   callback = function(ev)
  --     --     -- Enable completion triggered by <c-x><c-o>
  --     --     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  --     --
  --     --     -- Buffer local mappings.
  --     --     -- See `:help vim.lsp.*` for documentation on any of the below functions
  --     --     local opts = { buffer = ev.buf }
  --     --     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  --     --     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  --     --     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  --     --     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  --     --     -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  --     --     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  --     --     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  --     --     vim.keymap.set('n', '<space>wl', function()
  --     --       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --     --     end, opts)
  --     --     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  --     --     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  --     --     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  --     --     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  --     --     vim.keymap.set('n', '<space>f', function()
  --     --       vim.lsp.buf.format { async = true }
  --     --     end, opts)
  --     --   end,
  --     -- })
  --   end
  -- }
}
