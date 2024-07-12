return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      copilot_node_command = vim.fn.expand '$HOME' .. '/.nvm/versions/node/v20.15.1/bin/node',
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = '[[',
          jump_next = ']]',
          accept = '<CR>',
          refresh = 'gr',
          open = '<M-\\>',
        },
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = '<M-CR>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      filetypes = {
        markdown = true,
        ['.'] = false,
      },
    },
    config = function(_, opts)
      require('copilot').setup(opts)
      vim.keymap.set('i', '<C-c>', function()
        require('copilot.suggestion').dismiss()
        return '<C-c>'
      end, { expr = true })
    end,
  },
}
