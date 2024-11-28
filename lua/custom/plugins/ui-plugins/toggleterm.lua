return {
  {
    'akinsho/toggleterm.nvim',
    keys = {
      { '<M-[>', mode = { 't', 'n' }, desc = 'Open terminal below' },
      { '<M-]>', mode = { 't', 'n' }, desc = 'Open terminal right' },
      { '<M-\\>', mode = { 't', 'n' }, desc = 'Open terminal float' },
      { '<leader>gl', mode = { 'n' }, desc = 'Open lazygit' },
    },
    config = function()
      local term = require('toggleterm.terminal').Terminal

      local h = term:new { direction = 'horizontal' }
      vim.keymap.set({ 't', 'n' }, '<M-[>', function()
        h:toggle()
      end)

      local v = term:new {
        direction = 'vertical',
        on_open = function(self)
          self:resize(80)
        end,
      }
      vim.keymap.set({ 't', 'n' }, '<M-]>', function()
        v:toggle()
      end)

      local f = term:new { direction = 'float' }
      vim.keymap.set({ 't', 'n' }, '<M-\\>', function()
        f:toggle()
      end)

      local lazygit = term:new { cmd = 'lazygit', hidden = true, direction = 'float', close_on_exit = true }
      lazygit.dir = vim.fn.expand '%:p:h' -- current working directory
      vim.keymap.set({ 'n' }, '<leader>gl', function()
        lazygit:toggle()
      end)
    end,
  },
}
