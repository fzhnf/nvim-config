return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function() -- This is the function that runs, AFTER loading
      -- Document existing key chains
      require('which-key').register {
        ['<leader>l'] = { name = '[L]SP', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]reesitter', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      }
      -- visual mode
      require('which-key').register({
        ['<leader>t'] = { name = '[T]reesitter', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      }, { mode = 'v' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
