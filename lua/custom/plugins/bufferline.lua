return {
  'akinsho/bufferline.nvim',
  event = 'BufRead',
  version = '*',
  keys = {
    { '<leader><tab>', '<cmd>bufferlinemovenext<cr>', desc = 'move to the next tab', mode = 'n' },
    { '<leader><s-tab>', '<cmd>bufferlinemoveprev<cr>', desc = 'move to the previous tab', mode = 'n' },
    { '<leader>be', '<cmd>bufferlinesortbyextension', desc = 'sort buffers by extension', mode = 'n' },
    { '<leader>bd', '<cmd>bufferlinesortbydirectory', desc = 'sort buffers by directory', mode = 'n' },
  },
  config = function()
    require('bufferline').setup {
      highlights = require('catppuccin.groups.integrations.bufferline').get(),

      options = {
        indicator = {
          style = 'none',
        },

        mode = 'buffers',
        separator_style = 'slope',
        diagnostics = 'nvim_lsp',
        offsets = {
          {
            filetype = 'neo-tree',
            text = '  Explorer',
            text_align = 'center',
            highlight = 'Directory',
          },
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    }
  end,
}
