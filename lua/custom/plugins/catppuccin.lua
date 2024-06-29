return {
  'catppuccin/nvim',
  name = 'catppuccin',
  opts = {
    integrations = {
      alpha = true,
      cmp = true,
      gitsigns = true,
      indent_blankline = {
        enabled = true,
        scope_color = 'lavender', -- catppuccin color (eg. `lavender`) Default: text
        colored_indent_levels = false,
      },
      mason = true,
      mini = {
        enabled = true,
        indentscope_color = 'lavender',
      },
      neotree = true,
      telescope = true,
      treesitter = true,
      which_key = true,
    },
  },
  config = function()
    vim.cmd.colorscheme 'catppuccin-macchiato'
  end,
}
