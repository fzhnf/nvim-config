return {
  {
    'mg979/vim-visual-multi',
    keys = {
      { '<C-n>', mode = { 'n', 'v' }, desc = 'Find Word', silent = true },
      { '<C-Down>', desc = 'Add Cursors Down' },
      { '<C-Up>', desc = 'Add Cursors Up' },
      { '<S-Right>', desc = 'Select Right' },
      { '<S-Left>', desc = 'Select Left' },
    },
    config = function()
      vim.g.VM_set_statusline = 0 -- disable VM's statusline updates to prevent clobbering
      vim.g.VM_silent_exit = 1 -- because the status line already tells me the mode
      vim.g.VM_leader = ''
    end,
  },
}
