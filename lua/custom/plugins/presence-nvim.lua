return {
  {
    'andweeb/presence.nvim',
    event = 'BufRead',
    config = function()
      require('presence').setup {
        neovim_image_text = '(◕ ̮ ◕)っ❃🌸💮🪷🌹🌺🌻🌼🌷🪻✿',
      }
    end,
  },
}
