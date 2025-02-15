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
      local v = term:new {
        direction = 'vertical',
        on_open = function(self)
          self:resize(80)
        end,
      }
      local f = term:new { direction = 'float' }
      local lazygit = term:new { cmd = 'lazygit', hidden = true, direction = 'float', close_on_exit = true }

      lazygit.dir = vim.fn.expand '%:p:h' -- current working directory

      local function set_keymap(mode, key, action)
        vim.keymap.set(mode, key, function()
          action:toggle()
        end)
      end

      set_keymap({ 't', 'n' }, '<M-[>', h)
      set_keymap({ 't', 'n' }, '<M-]>', v)
      set_keymap({ 't', 'n' }, '<M-\\>', f)
      set_keymap({ 't', 'n' }, '<leader>gl', lazygit)
    end,
  },
}
