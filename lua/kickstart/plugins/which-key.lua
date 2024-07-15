return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
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
        { '<leader>lg', group = '[G]oto' },
        { '<leader>gt', group = '[T]oggle ' },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
