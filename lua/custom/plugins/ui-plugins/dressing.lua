return {
  'stevearc/dressing.nvim',
  event = 'BufReadPost',

  opts = {
    select = { backend = { 'telescope', 'fzf_lua', 'fzf', 'builtin', 'nui' } },
  },
}
