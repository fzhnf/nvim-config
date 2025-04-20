return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  opts = {
    default_integrations = false,
    integrations = {
      neotree = true,
      treesitter = true,
      telescope = {
        enabled = true,
        style = 'nvchad',
      },
    },
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
