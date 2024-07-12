return {
  {
    'goolord/alpha-nvim',
    priority = 100,
    config = function()
      -- disable showmode, showtabline, show ruler
      local startify = require 'alpha.themes.startify'
      startify.nvim_web_devicons.enabled = false
      startify.nvim_web_devicons.highlight = false
      startify.section.header.val = {
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡀⠀⣠⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⢰⡀⢀⡆⠀⠀⠀⢀⡀⠀⠀⠀⠀⣆',
        '⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⣀⣠⠄⠸⡷⠄⢹⡧⠀⢀⡀⠀⠀⠍⠛⠀⣀⣤⠤⠖⢸⡷⠀⣿⠆⠀⢀⠀⢳⠀⠀⠀⠀⣿⠆⠀⠀⠀⠀⠀⠀⣀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠭⠛⢁⡠⠚⢉⠀⡖⡄⠀⢷⠀⠸⡇⠀⠀⠻⠀⠀⣠⠔⠋⢁⢠⢰⠀⠀⣧⠀⢸⡄⢠⠂⢀⢠⢠⠀⠴⡦⢸⡄⠀⡠⠁⠀⠷⡼⠁',
        '⠀⠀⠀⠀⢀⡀⡰⡆⠀⠀⠁⠀⠀⠀⠛⠛⠁⠀⢸⡆⠀⣷⠀⠀⠰⢄⠈⠁⠀⠀⠙⠞⠚⠀⠀⢻⠀⠸⡇⠺⠂⠸⡼⠾⠀⠁⠀⠘⣇⠀⣷⠂⠀⠀⣠⣄⡀⢸⣦',
        '⠀⠀⠀⠀⠈⠿⠇⠀⠀⡀⠾⢿⠿⣷⣶⣀⣀⣀⢸⡇⠀⢸⡀⠀⠿⠏⢀⣾⡿⣿⣶⣶⣶⣆⣀⢸⡇⠀⣇⠀⢀⠀⠀⣆⠀⢾⡆⠀⣿⠀⠀⠀⠀⠰⠶⠉⠀⠀⣷⡀',
        '⠀⠀⡐⠁⠀⠀⢁⠀⡼⠛⣦⣤⣤⡶⠛⠋⠛⠉⠁⡇⠀⢸⡇⠀⣤⡀⠀⠻⢦⣀⣠⣼⠿⠛⠁⠸⡇⠀⢻⢀⣾⠃⠀⢻⡄⠘⣧⠀⢻⠀⠀⣤⡄⠀⠀⡠⠀⣀⠘⡧',
        '⠀⠀⡟⠁⠀⡠⠛⠁⣧⡀⠈⢉⠋⠐⠟⠀⠀⠀⢀⡇⡠⠈⡇⠀⠉⠁⣠⣴⢿⢿⣧⠐⠛⢀⠀⣠⠇⢠⢸⢸⢿⠀⠀⢸⣇⠀⢘⡆⢸⠂⣼⠀⠻⠶⠞⠻⠾⠛⠿⠃',
        '⢀⠌⠠⠐⢋⣴⠾⠛⠛⠛⢇⠃⠀⠀⠛⣡⣴⠾⠛⢱⡥⠀⠁⢀⣴⡾⢋⠀⠃⠀⠁⠈⣻⣷⠟⠋⢀⠈⢮⡾⡘⢷⣶⢯⠚⠛⠛⠀⣨⣤⣾⢷⣦⠀⠀⢀⡀⠰⢷',
        '⠸⣦⣤⡴⠛⠁⣴⡴⢷⠀⢸⠀⢀⣠⡾⠋⢠⠃⢠⡀⢀⣠⣴⠟⠋⢠⡁⢸⠀⢀⣴⠟⠉⠀⠀⢠⣂⠀⠀⢀⡟⠃⠀⡆⠀⢀⣴⠞⠋⣰⠁⠀⣀⠔⠁⠁⣠⠴⠚⠋',
        '⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠁⠀⠀⠘⠃⠈⠛⠛⠉⠀⠀⠀⠘⠁⠈⠛⠛⠁⠀⠀⠀⠀⠈⠁⠀⠀⠓⠚⠀⠀⠘⠛⠋⠁⠀⠀⠛⠁⠀⠀⠀⠀⠐⠁',
      }

      -- center the buttons
      startify.section.top_buttons.val = {
        startify.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
        startify.button('q', '󰅚  Quit NVIM', ':qa<CR>'),
      }
      startify.section.bottom_buttons.val = {}

      startify.config.opts.noautocmd = true

      require('alpha').setup(startify.config)
      -- vim.api.nvim_create_autocmd('VimLeavePre', {
      --   callback = function()
      --     require('alpha').close()
      --   end,
      -- })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
