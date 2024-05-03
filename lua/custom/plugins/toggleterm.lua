return {
  {
    'akinsho/toggleterm.nvim',
    opts = {},
    config = function(_, opts)
      require('toggleterm').setup(opts)
      vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
      vim.keymap.set({ 't', 'n' }, '<C-[>', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Open terminal below' })
      vim.keymap.set({ 't', 'n' }, '<C-]>', '<cmd>ToggleTerm direction=vertical size=45<cr>', { desc = 'Open terminal right' })
      vim.keymap.set({ 't', 'n' }, '<C-\\>', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Open floating terminal' })
    end,
  },
}
