return {
  {
    'akinsho/toggleterm.nvim',
    opts = {},
    keys = {
      { '<A-[>', '<cmd>ToggleTerm direction=horizontal<cr>', mode = { 't', 'n' }, desc = 'Open terminal below' },
      { '<A-]>', '<cmd>ToggleTerm direction=vertical size=60<cr>', mode = { 't', 'n' }, desc = 'Open terminal right' },
      { '<A-\\>', '<cmd>ToggleTerm direction=tab<cr>', mode = { 't', 'n' }, desc = 'Open  terminal in tab mode' },
      { '<A-CR>', '<cmd>ToggleTerm direction=float<cr>', mode = { 't', 'n' }, desc = 'Open floating terminal ' },
      -- { '<leader>gl', desc = 'Open lazygit' },
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
  },
}
