return {
  {
    'akinsho/toggleterm.nvim',
    keys = {
      { '<M-[>', '<cmd>ToggleTerm name=h direction=horizontal<cr>', mode = { 't', 'n' }, desc = 'Open terminal below' },
      { '<M-]>', '<cmd>ToggleTerm direction=vertical<cr>', mode = { 't', 'n' }, desc = 'Open terminal right' },
      { '<M-\\>', '<cmd>ToggleTerm direction=tab<cr>', mode = { 't', 'n' }, desc = 'Open  terminal in tab mode' },
      { '<M-CR>', '<cmd>ToggleTerm  direction=float<cr>', mode = { 't', 'n' }, desc = 'Open floating terminal ' },
      {
        '<leader>gl',
        function()
          local Terminal = require('toggleterm.terminal').Terminal
          local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float', close_on_exit = true }

          lazygit.dir = vim.fn.expand '%:p:h' -- current working directory
          lazygit:toggle()
        end,
        desc = 'Open lazygit',
      },
    },
    opts = {},
  },
}
