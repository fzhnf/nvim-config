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
  -- =======
  --   -- NOTE: Plugins can also be added by using a table,
  --   -- with the first argument being the link and the following
  --   -- keys can be used to configure plugin behavior/loading/etc.
  --   --
  --   -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --   --
  --
  --
  --   -- modular approach: using `require 'path/name'` will
  --   -- include a plugin definition from file lua/path/name.lua
  --
  --   require 'kickstart/plugins/gitsigns',
  --
  --   require 'kickstart/plugins/which-key',
  --
  --   require 'kickstart/plugins/telescope',
  --
  --   require 'kickstart/plugins/lspconfig',
  --
  --   require 'kickstart/plugins/conform',
  --
  --   require 'kickstart/plugins/cmp',
  --
  --   require 'kickstart/plugins/tokyonight',
  --
  --   require 'kickstart/plugins/todo-comments',
  --
  --   require 'kickstart/plugins/mini',
  --
  --   require 'kickstart/plugins/treesitter',
  --
  --   -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  --   -- init.lua. If you want these files, they are in the repository, so you can just download them and
  --   -- place them in the correct locations.
  --
  --   -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --   --
  --   --  Here are some example plugins that I've included in the Kickstart repository.
  --   --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --   --
  --   -- require 'kickstart.plugins.debug',
  --   -- require 'kickstart.plugins.indent_line',
  --   -- require 'kickstart.plugins.lint',
  --   -- require 'kickstart.plugins.autopairs',
  --   -- require 'kickstart.plugins.neo-tree',
  --
  --   -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --   --    This is the easiest way to modularize your config.
  --   --
  --   --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --   -- { import = 'custom.plugins' },
  --   --
  -- >>>>>>> source
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
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
