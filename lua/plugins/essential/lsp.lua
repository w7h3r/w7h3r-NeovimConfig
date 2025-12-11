return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'ray-x/lsp_signature.nvim',
  },
  config = function()
    local mason_ok, mason = pcall(require, 'mason')
    if mason_ok then mason.setup() end
    local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')
    if mason_lsp_ok then mason_lsp.setup({ ensure_installed = { 'clangd' } }) end

    local util_ok, util = pcall(require, 'lspconfig.util')
    if not util_ok then util = nil end

    local lsp_signature_ok, lsp_signature = pcall(require, 'lsp_signature')
    local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    if cmp_ok and cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    local on_attach = function(client, bufnr)
      if lsp_signature_ok then
        lsp_signature.on_attach({ bind = true, hint_enable = true, floating_window = true, handler_opts = { border = 'rounded' } }, bufnr)
      end
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    end

    local function clangd_running(bufnr)
      local clients = vim.lsp.get_clients({ bufnr = bufnr })
      for _, c in ipairs(clients) do
        if c.name == 'clangd' then
          return true
        end
      end
      return false
    end

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'c', 'cpp' },
      callback = function(args)
        local bufnr = args.buf
        if clangd_running(bufnr) then return end
        local path = vim.api.nvim_buf_get_name(bufnr)
        local root_dir
        if util then
          root_dir = util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git')(path) or util.path.cwd()
        else
          root_dir = vim.loop.cwd()
        end
        local cfg = {
          name = 'clangd',
          cmd = { 'clangd' },
          root_dir = root_dir,
          capabilities = capabilities,
          flags = { debounce_text_changes = 150 },
        }
        local client_id = vim.lsp.start_client(cfg)
        if client_id then
          vim.lsp.buf_attach_client(bufnr, client_id)
          local client = vim.lsp.get_client_by_id(client_id)
          if client and on_attach then
            pcall(on_attach, client, bufnr)
          end
        end
      end,
    })
  end,
}
