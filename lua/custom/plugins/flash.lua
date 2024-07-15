return {
  {
    'folke/flash.nvim',
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash jump',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    },
    opts = {
      modes = {
        -- a regular search with `/` or `?`
        search = {
          enabled = true,
        },
        -- `f`, `F`, `t`, `T`, `;` and `,` motions
        char = {
          enabled = false,
        },
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
