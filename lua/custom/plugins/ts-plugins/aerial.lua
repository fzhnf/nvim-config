return {
  {
    'stevearc/aerial.nvim',
    lazy = true,
    keys = { { '<leader>ta', '<CMD>AerialToggle right<CR>', desc = 'Toggle [A]erial view', mode = 'n' } },
    opts = {
      close_automatic_events = { 'unsupported' },
    },
  },
}
