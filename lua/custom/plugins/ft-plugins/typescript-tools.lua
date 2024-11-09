return {
  'pmizio/typescript-tools.nvim',
  ft = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    require('typescript-tools').setup {
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
        single_file_support = false,
      },
    }
  end,
}
