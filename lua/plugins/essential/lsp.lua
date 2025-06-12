return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'ray-x/lsp_signature.nvim',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'clangd',
      },
    })
    local lspconfig = require('lspconfig')
    local on_attach = function(client, bufnr)
      require('lsp_signature').on_attach({
        bind = true,
        hint_enable = true,
        floating_window = true,
        handler_opts = {
          border = 'rounded'
        }
      }, bufnr)
    end
    lspconfig.clangd.setup({
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    })
  end
}
