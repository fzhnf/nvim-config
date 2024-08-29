-- [[ Configure and install plugins ]]
require('lazy').setup {
  spec = {
    { import = 'kickstart.plugins' },
    { import = 'custom.plugins.ft-plugins' },
    { import = 'custom.plugins.ts-plugins' },
    { import = 'custom.plugins.ui-plugins' },
    { import = 'custom.plugins.util-plugins' },
    { import = 'custom.plugins.vim-plugins' },
  },

  install = { colorscheme = { 'catppuccin' } },
  change_detection = {
    notify = false,
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to includes in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘ ',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '🜸 ',
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

-- vim: ts=2 sts=2 sw=2 et
