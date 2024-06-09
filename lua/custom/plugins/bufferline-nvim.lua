return {
  {
    'akinsho/bufferline.nvim',
    event = 'BufRead',
    opts = {
      options = {
        mode = 'buffers',
        numbers = 'none',
        diagnostics = 'nvim_lsp',
        -- close_command = require('custom.bdelete').close_buffer,
        offsets = {
          {
            filetype = 'neo-tree',
            text = function()
              return vim.fn.getcwd()
            end,
            text_align = 'left',
            highlight = 'Directory',
            separator = true,
          },
        },
        separator_style = 'thin',
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
}
