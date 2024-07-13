return {
  'kylechui/nvim-surround',
  version = '*', -- Use for stability; omit to use `main` branch for the latest features
  keys = {
    { '<C-g>s', desc = 'Surround in insert mode' },
    { '<C-g>S', desc = 'Surround in insert line mode' },
    { 'ys', desc = 'Surround in normal mode' },
    { 'yss', desc = 'Surround in normal mode with cursor at the start' },
    { 'yS', desc = 'Surround in normal mode with cursor at the end' },
    { 'ySS', desc = 'Surround in normal mode with cursor at the end' },
    { 'S', desc = 'Surround in visual mode' },
    { 'gS', desc = 'Surround in visual line mode' },
    { 'ds', desc = 'Delete surround' },
    { 'cs', desc = 'Change surround' },
    { 'cS', desc = 'Change surround in line mode' },
  },
  opts = {
    keymaps = {
      insert = '<C-g>s',
      insert_line = '<C-g>S',
      normal = 'ys',
      normal_cur = 'yss',
      normal_line = 'yS',
      normal_cur_line = 'ySS',
      visual = 'S',
      visual_line = 'gS',
      delete = 'ds',
      change = 'cs',
      change_line = 'cS',
    },
  },
}
