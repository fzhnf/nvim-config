return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('which-key').add {
        { '<leader>l', group = '[L]SP' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>b', group = '[B]uffer' },
        {
          mode = { 'n', 'v' },
          { '<leader>t', group = '[T]reesitter]' },
          { '<leader>g', group = '[G]it' },
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
