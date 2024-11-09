return {
  {
    'danymat/neogen',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', lazy = true },
      { 'L3MON4D3/LuaSnip', lazy = true },
    },
    cmd = 'Neogen',
    opts = { snippet_engine = 'luasnip' },
    keys = {
      {
        '<leader>tg',
        function()
          vim.ui.select({ 'any', 'func', 'class', 'type', 'file' }, {
            prompt = 'select annotation type:',
            format_item = function(item)
              return 'generate ' .. item
            end,
          }, function(input)
            require('neogen').generate { type = input }
          end)
        end,
        mode = { 'n', 'v' },
        desc = '[G]enerate annotation',
        silent = true,
      },
    },
  },
}
