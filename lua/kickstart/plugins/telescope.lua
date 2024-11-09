return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
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
  },
  {
    'jvgrootveld/telescope-zoxide',
    keys = { { '<leader>sl', '<CMD>Telescope zoxide list<CR>', desc = '[S]earch [L]ist zoxide' } },
    config = function()
      require('telescope').load_extension 'zoxide'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
