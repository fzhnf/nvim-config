return {
  {
    'akinsho/bufferline.nvim',
    event = 'BufRead',
    config = function()
      local bufferline = require 'bufferline'
      local macchiato = require('catppuccin.palettes').get_palette 'macchiato'
      require('bufferline').setup {
        highlights = {
          tab = {
            fg = macchiato.lavender,
          },
          tab_selected = {
            fg = macchiato.base,
            bg = macchiato.lavender,
          },
          buffer_selected = {
            fg = macchiato.lavender,
            bg = macchiato.surface0,
            italic = true,
          },
        },
        options = {
          mode = 'buffers',
          style_preset = bufferline.style_preset.minimal,
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
      }
    end,
  },
}
