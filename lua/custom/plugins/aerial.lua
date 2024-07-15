return {
  {
    'stevearc/aerial.nvim',
    lazy = true,
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', lazy = true },
    keys = { { '<leader>ta', '<CMD>AerialToggle right<CR>', desc = 'Toggle [A]erial view', mode = 'n' } },
    -- Optional dependencies
    opts = {
      close_automatic_events = { 'unsupported' },
    },
  },
}
