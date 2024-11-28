return {
  'stevearc/dressing.nvim',
  event = 'BufReadPost',
  lazy = true,
  opts = {
    select = { backend = { 'telescope', 'fzf_lua', 'fzf', 'builtin', 'nui' } },
  },
}
