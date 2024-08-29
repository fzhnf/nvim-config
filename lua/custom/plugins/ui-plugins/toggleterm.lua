return {
  {
    'akinsho/toggleterm.nvim',
    keys = {
      { '<M-[>', '<CMD>ToggleTerm direction=horizontal<CR>', mode = { 't', 'n' }, desc = 'Open terminal below' },
      { '<M-]>', '<CMD>ToggleTerm direction=vertical<CR>', mode = { 't', 'n' }, desc = 'Open terminal right' },
      { '<M-\\>', '<CMD>ToggleTerm direction=tab<CR>', mode = { 't', 'n' }, desc = 'Open  terminal in tab mode' },
      { '<M-CR>', '<CMD>ToggleTerm  direction=float<CR>', mode = { 't', 'n' }, desc = 'Open floating terminal ' },
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
