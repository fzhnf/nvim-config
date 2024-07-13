return {
  {
    'stevearc/aerial.nvim',
    opts = {
      close_automatic_events = { 'unsupported' },
    },
    keys = { { '<leader>ta', '<CMD>AerialToggle right<CR>', desc = 'Toggle [A]erial view', mode = 'n' } },
    -- Optional dependencies
    dependencies = 'nvim-treesitter/nvim-treesitter',
  },
}
