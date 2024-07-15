return {
  'akinsho/bufferline.nvim',
  version = '*',
  event = 'BufReadPost',
  keys = {
    { '<tab>', '<CMD>BufferLineCycleNext<CR>', desc = 'move to the next tab' },
    { '<S-tab>', '<CMD>BufferLineCyclePrev<CR>', desc = 'move to the previous tab' },
    { ']b', '<CMD>BufferLineMoveNext<CR>', desc = 'move to the next tab' },
    { '[b', '<CMD>BufferLineMovePrev<CR>', desc = 'move to the previous tab' },
    { '<leader>be', '<CMD>BufferLineSortByExtension<CR>', desc = 'sort buffers by extension' },
    { '<leader>bd', '<CMD>BufferLineSortByDirectory<CR>', desc = 'sort buffers by directory' },
  },
  config = function()
    require('bufferline').setup {
      highlights = require('catppuccin.groups.integrations.bufferline').get(),

      options = {
        indicator = {
          style = 'none',
        },

        mode = 'buffers',
        separator_style = { '', '' },
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
