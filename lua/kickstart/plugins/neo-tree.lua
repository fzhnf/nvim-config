-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- function ToggleNeotree()
--   -- Check if Neotree is the active buffer
--   local current_buf = vim.fn.bufname '%'
--   if current_buf == 'neo-tree' then
--     -- If Neotree is focused, switch focus to the previous buffer
--     vim.cmd 'silent wincmd p'
--   else
--     -- If Neotree is not focused, toggle Neotree
--     vim.cmd 'silent Neotree focus left'
--   end
-- end

return {
  'nvim-neo-tree/neo-tree.nvim',
  event = 'VeryLazy',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree focus left<CR>', desc = 'NeoTree toggle', silent = true },
    { '<M-e>', ':Neotree toggle left<CR>', desc = 'NeoTree reveal', silent = true },
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
  -- config = function(_, opts)
  --   require('neo-tree').setup(opts)
  --   vim.keymap.set('n', '<leader>e', ':Neotree focus left<CR>', { desc = 'NeoTree toggle', silent = true })
  --   vim.keymap.set('n', '<M-e>', ':Neotree toggle left<CR>', { desc = 'NeoTree reveal', silent = true })
  -- end,
}

-- vim: ts=2 sts=2 sw=2 et
