return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'BufReadPost',
    opts = {
      options = {
        icons_enabled = vim.g.have_nerd_font,
        component_separators = { left = '⟩', right = '⟨' },
        section_separators = { left = '', right = '' },
        always_divide_middle = false,
        refresh = {
          statusline = 500,
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
        lualine_x = {},
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { 'neo-tree', 'toggleterm', 'lazy' },
    },
  },
}
