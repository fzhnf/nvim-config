return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter',
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
    opts = {
      plugins = {
        spelling = {
          enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        },
      },
    },
    config = function(_, opts)
      require('which-key').setup(opts)
      require('which-key').add {
        { '<leader>l', group = '[L]SP' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>b', group = '[B]uffer' },
        { '<leader>lg', group = '[G]oto' },
        {
          mode = { 'n', 'v' },
          { '<leader>t', group = '[T]reesitter]' },
          { '<leader>g', group = '[G]it' },
        },

        { '<leader>gt', group = '[T]oggle ' },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
