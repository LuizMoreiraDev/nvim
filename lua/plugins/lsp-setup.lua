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

      local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
      keyset('i', '<TAB>', "coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? '<TAB>' : coc#refresh()", opts)
      keyset('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : '\<C-h>']], opts)

      -- Use <c-j> to trigger snippets
      keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")

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

      -- Use <leader>d to show documentation in preview window
      function _G.show_docs()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
        else
          vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
      end
      keyset("n", "<leader>d", '<CMD>lua _G.show_docs()<CR>', {silent = true})

      -- Formatting selected code
      keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
      keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

      -- Toggle diagnostics
      keyset("n", "<leader>dd", "CocAction('diagnosticToggleBuffer')", {silent = true})

      -- Remap <C-f> and <C-b> to scroll float windows/popups
      ---@diagnostic disable-next-line: redefined-local
      local opts = {silent = true, nowait = true, expr = true}
      keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
      keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
      keyset("i", "<C-f>",
      'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
      keyset("i", "<C-b>",
      'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
      keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
      keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

      -- -- Add `:Format` command to format current buffer
      -- vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
      --
      -- -- " Add `:Fold` command to fold current buffer
      -- vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})
      --
      -- -- Add `:OR` command for organize imports of the current buffer
      -- vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

      -- Mappings for CoCList
      -- code actions and coc stuff
      ---@diagnostic disable-next-line: redefined-local
      local opts = {silent = true, nowait = true}
      -- Show all diagnostics
      keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
      -- Manage extensions
      keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
      -- Show commands
      keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
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
