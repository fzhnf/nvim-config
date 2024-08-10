return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'neovim/nvim-lspconfig', lazy = true },
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  opts = {
    settings = {
      separate_diagnostic_server = false,
    },
  },
  config = function(_, opts)
    require('typescript-tools').setup(opts)
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('TSToolsFormat', {}),
      pattern = '*.ts,*.tsx,*.jsx,*.js',
      callback = function()
        vim.cmd 'TSToolsAddMissingImports sync'
        vim.cmd 'TSToolsOrganizeImports sync'
      end,
    })
  end,
}
