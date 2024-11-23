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
    filetypes = filetypes,
    settings = {
      tsserver_plugins = {
        '@vue/typescript-plugin',
      },
    },
  },
}
