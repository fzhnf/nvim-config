-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<space>'] = 'none',
        },
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree focus left<CR>', { desc = 'focus file tree' })
    vim.keymap.set('n', '<M-e>', '<cmd>Neotree toggle left<CR>', { desc = 'Toggle file tree' })
  end,
}
