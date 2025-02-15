-- [[ Basic Keymaps ]]

-- Table of keybindings
local defaults = { noremap = true, silent = true }

local keymaps = {
  { 'n', '<Esc>', vim.cmd.nohlsearch },
  { { 'n', 'v' }, '<Space>', '<Nop>' },
  { 'v', '<', '<gv' },
  { 'v', '>', '>gv' },
  { 'n', '<BS>', '<C-V><BS>' },
  { 'n', 'k', 'v:count ? "k" : "gk"', { expr = true } },
  { 'n', 'j', 'v:count ? "j" : "gj"', { expr = true } },
  { { 'n', 'v' }, 'K', '4k' },
  { { 'n', 'v' }, 'J', '4j' },

  -- Toggle line numbers
  {
    'n',
    '<leader>n',
    function()
      vim.wo.number = not vim.wo.number
    end,
    { desc = 'Toggle line numbers' },
  },
  {
    'n',
    '<leader>N',
    function()
      vim.wo.relativenumber = not vim.wo.relativenumber
    end,
    { desc = 'Toggle relative line numbers' },
  },

  -- Save file
  {
    'n',
    '<C-s>',
    function()
      if vim.fn.filewritable(vim.fn.expand '%') ~= 1 then
        return
      end
      if vim.fn.expand '%' ~= '' then
        vim.cmd.update()
        return
      end
      vim.ui.input({ prompt = 'Save as: ' }, function(input)
        if input then
          vim.cmd.write(input)
        end
      end)
    end,
    { desc = 'Save the current file' },
  },

  -- Traverse in insert mode
  { 'i', '<M-h>', '<Left>' },
  { 'i', '<M-l>', '<Right>' },
  {
    'i',
    '<M-j>',
    function()
      return vim.v.count and vim.cmd 'normal j' or vim.cmd 'normal gj'
    end,
  },
  {
    'i',
    '<M-k>',
    function()
      return vim.v.count and vim.cmd 'normal k' or vim.cmd 'normal gk'
    end,
  },

  -- Tabs
  { 'n', '<C-w>t', vim.cmd.tabnew, { desc = 'Open new tab' } },
  { 'n', '<C-w><Tab>', vim.cmd.tabnext, { desc = 'Next tab' } },
  { 'n', '<C-w><S-tab>', vim.cmd.tabprevious, { desc = 'Previous tab' } },

  -- Window resizing
  { { 'n', 't' }, '<M-Up>', '<CMD>resize -2<CR>', { desc = 'Resize up' } },
  { { 'n', 't' }, '<M-Down>', '<CMD>resize +2<CR>', { desc = 'Resize down' } },
  { { 'n', 't' }, '<M-Left>', '<CMD>vertical resize -2<CR>', { desc = 'Resize left' } },
  { { 'n', 't' }, '<M-Right>', '<CMD>vertical resize +2<CR>', { desc = 'Resize right' } },

  -- Buffers
  { 'n', '<leader>x', '<CMD>Bdelete<CR>', { desc = 'Delete buffer' } },

  -- Terminal navigation
  { 't', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Left window' } },
  { 't', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Below window' } },
  { 't', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Above window' } },
  { 't', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Right window' } },

  -- Diagnostics
  { 'n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' } },
  { 'n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' } },
  { 'n', '<leader>q', vim.diagnostic.open_float, { desc = 'Show diagnostics' } },
  { 'n', '<leader>Q', vim.diagnostic.setloclist, { desc = 'Diagnostics list' } },

  -- LSP
  { 'n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' } },
  { 'n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' } },
  { 'n', '<leader>fm', vim.lsp.buf.format, { desc = 'Format buffer' } },

  -- Plugins
  { 'n', '<leader>e', '<CMD>Neotree toggle<CR>', { desc = 'Toggle file explorer' } },
  { 'n', '<leader>tt', '<CMD>ToggleTerm<CR>', { desc = 'Toggle terminal' } },
  { 'n', '<leader>ff', '<CMD>Telescope find_files<CR>', { desc = 'Find files' } },
  { 'n', '<leader>fr', '<CMD>Telescope oldfiles<CR>', { desc = 'Recent files' } },
}

-- Apply keymaps with defaults
for _, keymap in ipairs(keymaps) do
  local mode, lhs, rhs, opts = unpack(keymap)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', defaults, opts or {}))
end

-- [[ Basic Autocommands ]]
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ User Commands ]]
-- Open Alpha when there is no buffer and confirm to delete buffer when modified
local function bdelete()
  if #vim.fn.getbufinfo { buflisted = 1 } > 1 then
    vim.cmd 'bprevious|bdelete!#'
    return
  end
  vim.cmd 'Alpha|bdelete!#'
end

vim.api.nvim_create_user_command('Bdelete', function()
  -- Check if the file type is in excluded file types, if so, don't delete
  if vim.tbl_contains({ 'neo-tree', 'toggleterm', 'lazy', 'mason', 'alpha', 'aerial' }, vim.bo.filetype) then
    return
  end

  if not vim.bo.modified then
    bdelete()
    return
  end

  local choice = vim.fn.confirm('Save changes to ' .. vim.fn.bufname(vim.fn.bufnr '%') .. ' ?', '&Yes\n&No\n&Cancel')
  if choice == 3 then
    return
  elseif choice == 1 then
    vim.cmd 'silent write'
  end
  bdelete()
end, {})
