return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
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
    },
    --     -      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    -- -      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    -- -      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    -- -      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    -- -      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    -- -      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    -- -      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    -- -      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    -- -      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    -- -      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    -- -
    -- -      -- Slightly advanced example of overriding default behavior and theme
    -- -      vim.keymap.set('n', '<leader>/', function()
    -- -        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    -- -        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    -- -          winblend = 10,
    -- -          previewer = false,
    -- -        })
    -- -      end, { desc = '[/] Fuzzily search in current buffer' })
    -- -
    -- -      -- It's also possible to pass additional configuration options.
    -- -      --  See `:help telescope.builtin.live_grep()` for information about particular keys
    -- -      vim.keymap.set('n', '<leader>s/', function()
    -- -        builtin.live_grep {
    -- -          grep_open_files = true,
    -- -          prompt_title = 'Live Grep in Open Files',
    -- -        }
    -- -      end, { desc = '[S]earch [/] in Open Files' })
    -- -
    -- -      -- Shortcut for searching your Neovim configuration files
    -- -      vim.keymap.set('n', '<leader>sn', function()
    -- -        builtin.find_files { cwd = vim.fn.stdpath 'config' }
    -- -      end, { desc = '[S]earch [N]eovim files' })
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
