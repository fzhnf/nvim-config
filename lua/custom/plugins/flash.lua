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
  },
  -- 'ggandor/leap.nvim',
  -- keys = {
  --   { 'f', mode = { 'n', 'x', 'o' }, desc = 'Leap Forward to' },
  --   { 'F', mode = { 'n', 'x', 'o' }, desc = 'Leap Backward to' },
  --   { 'gf', mode = { 'n', 'x', 'o' }, desc = 'Leap from Windows' },
  -- },
  -- config = function()
  --   vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap-forward)')
  --   vim.keymap.set({ 'n', 'x', 'o' }, 'F', '<Plug>(leap-backward)')
  --   vim.keymap.set({ 'n', 'x', 'o' }, 'gf', '<Plug>(leap-from-window)')
  -- end,
}

-- vim: ts=2 sts=2 sw=2 et
