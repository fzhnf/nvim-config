local filetypes = {
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
  'vue',
}

return {
  'pmizio/typescript-tools.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
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
}
