return {
  {
    'folke/persistence.nvim',
    opts = {},
    lazy = true,
    init = function()
      local persistenceGroup = vim.api.nvim_create_augroup('Persistence', { clear = true })
      local home = vim.fn.expand '~'
      local disabled_dirs = {
        home,
        home .. '/Downloads',
        '/',
      }

      -- disable persistence for certain directories
      vim.api.nvim_create_autocmd({ 'VimEnter' }, {
        group = persistenceGroup,
        callback = function()
          local cwd = vim.fn.getcwd()
          for _, path in pairs(disabled_dirs) do
            if path == cwd then
              require('persistence').stop()
              return
            end
          end
          if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
            require('persistence').load()
          else
            require('persistence').stop()
          end
        end,
        nested = true,
      })
    end,
  },
  -- {
  --   'rmagatti/auto-session',
  --   config = function()
  --     require('auto-session').setup {
  --       log_level = 'error',
  --       auto_session_suppress_dirs = { '~/', '~/Downloads', '/' },
  --       session_lens = {
  --         load_on_setup = false,
  --       },
  --       bypass_session_save_file_types = {
  --         '',
  --         'blank',
  --         'neo-tree',
  --         'alpha',
  --         'noice',
  --         'notify',
  --       },
  --       pre_save_cmds = { 'Neotree close' },
  --     }
  --   end,
  -- },
}

-- vim: ts=2 sts=2 sw=2 et
