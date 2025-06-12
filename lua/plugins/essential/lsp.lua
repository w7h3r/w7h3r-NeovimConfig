return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'ray-x/lsp_signature.nvim',
  },
  config = function()
    -- Setup mason
    require('mason').setup()

    -- Setup mason-lspconfig
    require('mason-lspconfig').setup({
      ensure_installed = {
        'clangd',
      },
    })

    -- Load lspconfig
    local lspconfig = require('lspconfig')

    -- Common on_attach function
    local on_attach = function(client, bufnr)
      -- Enable lsp_signature
      require('lsp_signature').on_attach({
        bind = true,
        hint_enable = true,
        floating_window = true,
        handler_opts = {
          border = 'rounded'
        }
      }, bufnr)
    end

    -- Setup clangd
    lspconfig.clangd.setup({
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    })
  end
}
