return {
  'kevinhwang91/nvim-ufo',
  event = 'BufRead',
  dependencies = { 'kevinhwang91/promise-async', lazy = true },
  config = function()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    require('ufo').setup {}
  end,
}

-- vim: ts=2 sts=2 sw=2 et
