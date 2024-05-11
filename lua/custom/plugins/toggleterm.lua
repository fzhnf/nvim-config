return {
  {
    'akinsho/toggleterm.nvim',
    opts = {},
    keys = {
      { '<M-[>', '<cmd>ToggleTerm direction=horizontal<cr>', mode = { 't', 'n' }, desc = 'Open terminal below' },
      { '<M-]>', '<cmd>ToggleTerm direction=vertical size=45<cr>', mode = { 't', 'n' }, desc = 'Open terminal right' },
      { '<M-\\>', '<cmd>ToggleTerm direction=float<cr>', mode = { 't', 'n' }, desc = 'Open floating terminal' },
    },
  },
}
