return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'BufRead',
    config = function()
      require('copilot').setup {
        suggestion = {
          auto_trigger = true,
        },
      }
    end,
  },
}
