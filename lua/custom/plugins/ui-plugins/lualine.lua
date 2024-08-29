return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'BufRead',
    opts = {
      options = {
        icons_enabled = vim.g.have_nerd_font,
        theme = 'catppuccin',
        component_separators = '',
        section_separators = '',
        always_divide_middle = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(mode)
              return vim.b['visual_multi'] and mode .. ' - MULTI' or mode
            end,
          },
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 }, 'aerial' },
        lualine_x = { { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_c = { { 'filename', path = 1 } },
        lualine_z = { 'location' },
      },
      --   tabline = {
      --     -- TODO: change from nvim-tree to neo-tree
      --
      --     -- lualine_a = {
      --     --   {
      --     --     function()
      --     --       -- return string.rep(' ', vim.api.nvim_win_get_width(require('nvim-tree.view').get_winnr()) - 1)
      --     --       return string.rep(' ', vim.api.nvim_win_get_width(require('neo-tree.sources.common.preview').winid) - 1)
      --     --     end,
      --     --     -- cond = require('nvim-tree.view').is_visible,
      --     --     conf = require('neo-tree.sources.common.preview').is_active(),
      --     --     color = 'NvimTreeNormal',
      --     --   },
      --     -- },
      --     lualine_b = { { 'buffers', mode = 2 } },
      --     lualine_z = { 'tabs' },
      --   },
      extensions = { 'neo-tree', 'toggleterm', 'lazy' },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
