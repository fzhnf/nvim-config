return {
  'akinsho/bufferline.nvim',
  version = '*',
  event = 'BufRead',
  dependencies = {
    {
      'tiagovla/scope.nvim',
      event = 'BufReadPre',
      opts = {},
    },
  },
  keys = {
    { '<Tab>', '<CMD>BufferLineCycleNext<CR>', desc = 'move to the next tab' },
    { '<S-tab>', '<CMD>BufferLineCyclePrev<CR>', desc = 'move to the previous tab' },
    { ']b', '<CMD>BufferLineMoveNext<CR>', desc = 'move to the next tab' },
    { '[b', '<CMD>BufferLineMovePrev<CR>', desc = 'move to the previous tab' },
    { '<leader>be', '<CMD>BufferLineSortByExtension<CR>', desc = 'sort buffers by extension' },
    { '<leader>bd', '<CMD>BufferLineSortByDirectory<CR>', desc = 'sort buffers by directory' },
  },
  opts = {
    options = {
      close_command = 'Bdelete',
      indicator = {
        style = 'none',
      },
      mode = 'buffers',
      separator_style = { '', '' },
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = 'neo-tree',
          text = '  neo-tree',
          text_align = 'center',
          highlight = 'Directory',
        },
      },
    },
  },
}
