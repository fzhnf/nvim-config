-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = 'Neotree',
  branch = 'v3.x',
  dependencies = {
    { 'MunifTanjim/nui.nvim', lazy = true },
  },
  keys = {
    { '<leader>e', '<CMD>Neotree focus left<CR>', desc = 'NeoTree toggle', silent = true },
    { '<leader>o', '<CMD>Neotree toggle left<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    close_if_last_window = false,
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<space>'] = 'none',
        },
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
