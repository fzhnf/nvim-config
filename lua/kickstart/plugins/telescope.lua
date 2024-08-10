return {
  'nvim-telescope/telescope.nvim',
  version = false, -- telescope did only one release, so use HEAD for now
  cmd = 'Telescope',
  opts = {
    defaults = {
      mappings = {
        i = {
          ['<c-enter>'] = 'to_fuzzy_refine',
          ['<C-k>'] = 'move_selection_previous',
          ['<C-j>'] = 'move_selection_next',
        },
      },
    },
    -- pickers = {}
  },
  keys = {
    { '<leader>sh', '<CMD>Telescope help_tags<CR>', desc = '[S]earch [H]elp' },
    { '<leader>sk', '<CMD>Telescope keymaps<CR>', desc = '[S]earch [K]eymaps' },
    { '<leader>sf', '<CMD>Telescope find_files<CR>', desc = '[S]earch [F]iles' },
    { '<leader>ss', '<CMD>Telescope builtin<CR>', desc = '[S]earch [S]elect Telescope' },
    { '<leader>sw', '<CMD>Telescope grep_string<CR>', desc = '[S]earch current [W]ord' },
    {
      '<leader>sg',
      '<CMD>lua require("telescope.builtin").live_grep { glob_pattern = "!node_modules/*" }<CR>',
      desc = '[S]earch by [G]rep',
    },
    { '<leader>sd', '<CMD>Telescope diagnostics<CR>', desc = '[S]earch [D]iagnostics' },
    { '<leader>sr', '<CMD>Telescope resume<CR>', desc = '[S]earch [R]esume' },
    { '<leader>s.', '<CMD>Telescope oldfiles<CR>', desc = '[S]earch Recent Files ("." for repeat)' },
    { '<leader><leader>', '<CMD>Telescope buffers<CR>', desc = '[ ] Find existing buffers' },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    vim.keymap.set('n', '<leader>/', function()
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false })
    end, { desc = '[/] Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader>s/', function()
      require('telescope.builtin').live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files', glob_pattern = '!node_modules/*' }
    end, { desc = '[S]earch [/] in Open Files' })
    vim.keymap.set('n', '<leader>sn', function()
      require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config', prompt_title = 'Neovim Config File' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
