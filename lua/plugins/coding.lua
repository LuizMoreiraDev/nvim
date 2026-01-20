return {
  -- Treesitter (syntax highlighting)
  -- Optional: requires tree-sitter-cli 0.26.1+ and a C compiler
  -- In containers without these, nvim will work fine with basic syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    cond = function()
      -- Only load if tree-sitter-cli is available and recent enough
      local handle = io.popen('tree-sitter --version 2>/dev/null')
      if not handle then return false end
      local result = handle:read('*a')
      handle:close()
      if not result or result == '' then return false end

      -- Check version >= 0.26.1
      local major, minor, patch = result:match('tree%-sitter%s+(%d+)%.(%d+)%.(%d+)')
      if not major then return false end
      major, minor, patch = tonumber(major), tonumber(minor), tonumber(patch or 0)
      return major > 0 or (major == 0 and minor > 26) or (major == 0 and minor == 26 and patch >= 1)
    end,
    config = function()
      local languages = { 'lua', 'ruby', 'sql', 'html', 'css', 'scss', 'javascript', 'typescript' }
      local ts = require('nvim-treesitter')

      ts.setup()
      ts.install(languages)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = languages,
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

  -- LSP installer (installs language servers)
  {
    'williamboman/mason.nvim',
    config = true,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = { 'solargraph' },
      automatic_installation = true,
    },
  },

  -- LSP configuration (with fallback for Neovim < 0.11)
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      -- Minimal LSP keymaps (navigation only)
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end,
      })

      local solargraph_settings = {
        settings = {
          solargraph = {
            diagnostics = false,
            completion = false,
          },
        },
      }

      -- Neovim 0.11+ uses vim.lsp.config, older versions use lspconfig
      if vim.fn.has('nvim-0.11') == 1 then
        vim.lsp.config('solargraph', solargraph_settings)
        vim.lsp.enable('solargraph')
      else
        require('lspconfig').solargraph.setup(solargraph_settings)
      end
    end,
  },

  -- AI autocomplete
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      vim.g.codeium_disable_bindings = 1
      -- Accept suggestion with Tab
      vim.keymap.set('i', '<Tab>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true, silent = true })
      -- Cycle through suggestions
      vim.keymap.set('i', '<C-n>', function()
        return vim.fn['codeium#CycleCompletions'](1)
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-p>', function()
        return vim.fn['codeium#CycleCompletions'](-1)
      end, { expr = true, silent = true })
      -- Clear suggestion
      vim.keymap.set('i', '<C-x>', function()
        return vim.fn['codeium#Clear']()
      end, { expr = true, silent = true })
    end,
  },
}
