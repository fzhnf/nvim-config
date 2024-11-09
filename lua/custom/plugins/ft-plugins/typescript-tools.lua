local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

return {
  'pmizio/typescript-tools.nvim',
  ft = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'vue', -- This needed to be added.
    },
    settings = {
      capabilities = capabilities,
      tsserver_plugins = {
        '@vue/typescript-plugin',
      },
      separate_diagnostic_server = false,
    },
  },
}
