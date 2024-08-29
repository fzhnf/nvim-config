return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 102,
  opts = {
    background = {
      light = 'latte',
      dark = 'macchiato',
    },
    transparent_background = false,
    default_integrations = false,
    integrations = {
      bufferline = true,
      alpha = true,
      cmp = true,
      gitsigns = true,
      indent_blankline = {
        enabled = true,
        scope_color = 'lavender',
      },
      aerial = true,
      flash = true,
      ufo = true,
      mason = true,
      neotree = true,
      telescope = {
        enabled = true,
        style = 'nvchad',
      },
      treesitter = true,
      treesitter_context = true,
      which_key = true,
      fidget = true,
    },
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin-macchiato'
  end,
}
