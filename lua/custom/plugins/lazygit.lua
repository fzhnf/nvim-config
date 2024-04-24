return {
  {
    'kdheepak/lazygit.nvim',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<leader>gl', '<cmd>LazyGit<cr>', { desc = 'Open lazygit' })
    end,
  },
}
