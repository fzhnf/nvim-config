return {
  {
    'goolord/alpha-nvim',
    dependencies = {
      'DaikyXendo/nvim-material-icon',
    },

    config = function()
      local alpha = require 'alpha'
      local startify = require 'alpha.themes.startify'
      startify.nvim_web_devicons.enabled = vim.g.have_nerd_font
      startify.nvim_web_devicons.highlight = vim.g.have_nerd_font
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
      }
      startify.section.bottom_buttons.val = {
        startify.button('q', '󰅚  Quit NVIM', ':qa<CR>'),
      }
      alpha.setup(startify.opts)
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
