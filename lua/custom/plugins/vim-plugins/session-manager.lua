return {
  'Shatur/neovim-session-manager',
  lazy = false,
  priority = 1000,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local conf = require 'session_manager.config'
    local session_manager = require 'session_manager'
    session_manager.setup {
      autoload_mode = conf.AutoloadMode.CurrentDir,
      autosave_last_session = true,
      autosave_ignore_not_normal = true,
      autosave_ignore_dirs = { os.getenv 'HOME', '/', os.getenv 'HOME' .. '/Downloads' },
      autosave_ignore_filetypes = {
        'gitcommit',
        'gitrebase',
      },
      autosave_ignore_buftypes = { 'nofile' },
      autosave_only_in_session = false,
      max_path_length = 80,
      load_include_current = false,
    }
  end,
}
