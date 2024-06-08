return {
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_session_suppress_dirs = { '~/', '~/Downloads', '/' },
        session_lens = {
          load_on_setup = false,
        },
      }
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
