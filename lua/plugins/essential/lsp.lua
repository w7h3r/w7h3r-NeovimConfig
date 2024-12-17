return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'ray-x/lsp_signature.nvim',  -- Add lsp_signature.nvim for function signatures
  },
  config = function()
    -- Initialize mason for LSP management
    require('mason').setup()

    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup({
      ensure_installed = {
        "clangd",  -- For C/C++
      },
    })

    -- LSP configuration
    local lspconfig = require('lspconfig')

    -- clangd setup for C/C++
    lspconfig.clangd.setup({
      on_attach = function(client, bufnr)
        -- Enable signature help via lsp_signature.nvim
        require('lsp_signature').on_attach({
          bind = true,
          hint_enable = true,
          floating_window = true,
          handler_opts = {
            border = 'rounded'
          }
        })
      end,
      flags = {
        debounce_text_changes = 150,
      }
    })

  end
}

