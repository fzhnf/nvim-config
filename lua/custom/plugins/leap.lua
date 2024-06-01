return {
  'ggandor/leap.nvim',
  keys = {
    { 's', mode = { 'n', 'x', 'o' }, desc = 'Leap Forward to' },
    { 'S', mode = { 'n', 'x', 'o' }, desc = 'Leap Backward to' },
    { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from Windows' },
  },
  config = function()
    require('leap').add_default_mappings()
  end,
}
