-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = true,
  dependencies = {
    { 'MunifTanjim/nui.nvim', lazy = true },
  },
  keys = {
    { '<leader>e', '<CMD>Neotree reveal<CR>', desc = 'reveal neo-tree', silent = true },
    { '<leader>o', '<CMD>Neotree toggle left<CR>', desc = 'toggle neo-tree', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['G'] = function(state)
            state.filtered_items.visible = false
          end,
        },
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
