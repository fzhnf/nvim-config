return {
  'jvgrootveld/telescope-zoxide',
  keys = { { '<leader>sl', '<CMD>Telescope zoxide list<CR>', desc = '[S]earch [L]ist zoxide' } },
  config = function()
    require('telescope').load_extension 'zoxide'
  end,
}
