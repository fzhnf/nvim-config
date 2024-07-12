-- [[ Basic Keymaps ]]
local set = vim.keymap.set
local cmd = vim.cmd

-- changing the default keymaps behavior to make it more intuitive
set('n', '<Esc>', cmd.nohlsearch, { desc = 'Clear search highlights' })
set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
set('v', '<', '<gv')
set('v', '>', '>gv')
set('n', '<BS>', '<C-V><BS>', { silent = true })
set('n', 'k', 'v:count ? "k" : "gk"', { expr = true, silent = true })
set('n', 'j', 'v:count ? "j" : "gj"', { expr = true, silent = true })

-- moving faster
set({ 'n', 'v' }, 'K', '4k', { silent = true })
set({ 'n', 'v' }, 'J', '4j', { silent = true })

-- toggle line numbers
set('n', '<leader>n', function()
  vim.wo.number = not vim.wo.number
end, { desc = 'Toggle line numbers' })
set('n', '<leader>N', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = 'Toggle relative line numbers' })

-- save the file
set('n', '<C-s>', cmd.write, { desc = 'Save the current file', silent = true })

-- traverse text on insert mode
set('i', '<M-h>', '<Left>')
set('i', '<M-l>', '<Right>')
set('i', '<M-j>', function()
  return vim.v.count and cmd 'normal j' or cmd 'normal gj'
end)
set('i', '<M-k>', function()
  return vim.v.count and cmd 'normal k' or cmd 'normal gk'
end)

-- tab
set('n', '<C-w>t', cmd.tabnew, { desc = 'Open new empty tab' })
set('n', '<C-w><tab>', cmd.tabnext, { desc = 'Move to the next tab' })
set('n', '<C-w><S-tab>', cmd.tabprevious, { desc = 'Move to the previous tab' })

-- window
set('n', '<M-Up>', '<CMD>resize -2<CR>', { desc = 'Resize split up' })
set('n', '<M-Down>', '<CMD>resize +2<CR>', { desc = 'Resize split down' })
set('n', '<M-Left>', '<CMD>vertical resize -2<CR>', { desc = 'Resize split left' })
set('n', '<M-Right>', '<CMD>vertical resize +2<CR>', { desc = 'Resize split right' })

-- buffer
set('n', '<Tab>', cmd.bnext, { desc = 'Move to the next tab' })
set('n', '<S-Tab>', cmd.bprevious, { desc = 'Move to the previous tab' })
set('n', '<leader>x', '<CMD>Bdelete<CR>', { desc = 'Close the current buffer' })

-- Diagnostic
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>q', vim.diagnostic.open_float, { desc = 'Show diagnostic [q]uickfix on cursor line' })
set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

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
    cmd 'bnext|bdelete!#'
    return
  end
  cmd 'Alpha|bdelete!#'
end

vim.api.nvim_create_user_command('Bdelete', function()
  -- Check if the file type is in excluded file types, if so, don't delete
  if vim.tbl_contains({ 'neo-tree', 'toggleterm', 'lazy', 'mason', 'alpha' }, vim.bo.filetype) then
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
    cmd 'silent write'
  end
  bdelete()
end, {})

-- vim: ts=2 sts=2 sw=2 et
