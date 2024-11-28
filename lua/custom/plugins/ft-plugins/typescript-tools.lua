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
    root_dir = require('lspconfig').util.root_pattern 'package.json',
    filetypes = filetypes,
    settings = {
      tsserver_plugins = {
        '@vue/typescript-plugin',
      },
    },
  },
}
