return {
  'ggandor/leap.nvim',
  keys = {
    { 'f', mode = { 'n', 'x', 'o' }, desc = 'Leap Forward to' },
    { 'F', mode = { 'n', 'x', 'o' }, desc = 'Leap Backward to' },
    { 'gf', mode = { 'n', 'x', 'o' }, desc = 'Leap from Windows' },
  },
  config = function()
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap-forward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', '<Plug>(leap-backward)')
    vim.keymap.set({ 'n', 'x', 'o' }, 'gf', '<Plug>(leap-from-window)')
  end,
}

-- vim: ts=2 sts=2 sw=2 et
