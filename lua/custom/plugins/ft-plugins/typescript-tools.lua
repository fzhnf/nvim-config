local filetypes = {
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
  'vue',
}

return {
  'pmizio/typescript-tools.nvim',
  ft = filetypes,
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    single_file_support = false,
    filetypes = filetypes,
    settings = {
      tsserver_plugins = {
        '@vue/typescript-plugin',
      },
    },
  },
  config = function(_, opts)
    require('typescript-tools').setup(opts)
    local autocmd = vim.api.nvim_create_autocmd
    autocmd('BufWritePre', {
      pattern = '*.ts,*.tsx,*.jsx,*.js',
      callback = function()
        vim.cmd 'TSToolsAddMissingImports sync'
        vim.cmd 'TSToolsOrganizeImports sync'
      end,
    })
  end,
}
