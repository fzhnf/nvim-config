return {
  {
    'akinsho/bufferline.nvim',
    event = 'BufReadPre',
    opts = {
      options = {
        mode = 'buffers',
        numbers = 'none',
        diagnostics = 'nvim_lsp',
        close_command = require('custom.utils').close_buffer,
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
        always_show_bufferline = true,
      },
    },
  },
}
