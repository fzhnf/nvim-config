-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  { -- Fuzzy Finder (files, lsp, etc)
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
      { '<leader>sg', '<CMD>Telescope live_grep<CR>', desc = '[S]earch by [G]rep' },
      { '<leader>sd', '<CMD>Telescope diagnostics<CR>', desc = '[S]earch [D]iagnostics' },
      { '<leader>sr', '<CMD>Telescope resume<CR>', desc = '[S]earch [R]esume' },
      { '<leader>s.', '<CMD>Telescope oldfiles<CR>', desc = '[S]earch Recent Files ("." for repeat)' },
      { '<leader><leader>', '<CMD>Telescope buffers<CR>', desc = '[ ] Find existing buffers' },
      {
        '<leader>/',
        '<CMD>lua require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown { winblend = 10, previewer = false })<CR>',
        desc = '[/] Fuzzily search in current buffer',
      },
      {
        '<leader>s/',
        '<CMD>lua require("telescope.builtin").live_grep { grep_open_files = true, prompt_title = "Live Grep in Open Files" }<CR>',
        desc = '[S]earch [/] in Open Files',
      },
      {
        '<leader>sn',
        '<CMD>lua require("telescope.builtin").find_files { cwd = vim.fn.stdpath("config"), prompt_title = "Neovim Config File" }<CR>',
        desc = '[S]earch [N]eovim files',
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'jvgrootveld/telescope-zoxide',
    keys = { { '<leader>sl', '<CMD>Telescope zoxide list<CR>', desc = '[S]earch [L]ist zoxide' } },
    config = function()
      require('telescope').load_extension 'zoxide'
    end,
  },
  -- { -- If encountering errors, see telescope-fzf-native README for installation instructions
  --   'nvim-telescope/telescope-fzf-native.nvim',
  --
  --   -- `build` is used to run some command when the plugin is installed/updated.
  --   -- This is only run then, not every time Neovim starts up.
  --   build = 'make',
  --
  --   -- `cond` is a condition used to determine whether this plugin should be
  --   -- installed and loaded.
  --   cond = function()
  --     return vim.fn.executable 'make' == 1
  --   end,
  --   config = function()
  --     require('telescope').load_extension 'fzf'
  --   end,
  -- },
  -- {
  --   'nvim-telescope/telescope-ui-select.nvim',
  --   config = function()
  --     require('telescope').load_extension 'ui-select'
  --     require('telescope').setup {
  --       extensions = {
  --         ['ui-select'] = {
  --           require('telescope.themes').get_dropdown(),
  --         },
  --       },
  --     }
  --   end,
  -- },
}
-- vim: ts=2 sts=2 sw=2 et
