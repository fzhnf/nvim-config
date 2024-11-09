return {
  {
    'rmagatti/auto-session',
    priority = 1001,
    opts = {
      auto_session_suppress_dirs = { '~/', '~/Downloads', '/' },
      session_lens = {
        load_on_setup = false,
      },
      bypass_session_save_file_types = { 'neo-tree', 'alpha', 'help', 'blank' },
    },
  },
}
