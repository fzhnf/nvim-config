require('lazy').setup {
  defaults = {
    lazy = true,
  },
  spec = {
    { import = 'kickstart.plugins' },
    { import = 'custom.plugins.ft-plugins' },
    { import = 'custom.plugins.ts-plugins' },
    { import = 'custom.plugins.ui-plugins' },
    { import = 'custom.plugins.util-plugins' },
    { import = 'custom.plugins.vim-plugins' },
  },
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}
