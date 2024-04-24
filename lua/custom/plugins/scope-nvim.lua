return {
  {
    'tiagovla/scope.nvim',
    opts = {},
    config = function(_, opts)
      vim.opt.sessionoptions = {
        'buffers',
        'tabpages',
        'globals',
      }
      require('scope').setup(opts)
    end,
  },
}
