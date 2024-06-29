-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
local set = vim.keymap.set

set('n', '<Esc>', '<cmd>nohlsearch<CR>')
set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- changing the default keymaps behavior to make it more intuitive
set('n', ';', ':')
set('v', '<', '<gv')
set('v', '>', '>gv')
set('n', 'E', '$', { silent = true })
set('n', '<BS>', '<C-V><BS>', { silent = true })
set('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
set('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

-- moving faster
set({ 'n', 'v' }, 'K', '4k', { silent = true })
set({ 'n', 'v' }, 'J', '4j', { silent = true })
set({ 'n', 'v' }, 'H', 'b', { silent = true })
set({ 'n', 'v' }, 'L', 'e', { silent = true })

-- toggle line numbers
set('n', '<leader>n', function()
  vim.wo.number = not vim.wo.number
end, { desc = 'Toggle line numbers' })
set('n', '<leader>N', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = 'Toggle relative line numbers' })

-- save the file
set('n', '<C-s>', vim.cmd.update)

-- traverse text on insert mode
set({ 'i', 'c' }, '<C-h>', '<Left>', { silent = true })
set({ 'i', 'c' }, '<C-l>', '<Right>', { silent = true })
set({ 'i', 'c' }, '<C-j>', '<C-O>gj', { silent = true })
set({ 'i', 'c' }, '<C-k>', '<C-O>gk', { silent = true })
-- window
set('n', '<C-w>h', '<cmd>wincmd h<cr>', { desc = 'Move to the window on the left' })
set('n', '<C-w>j', '<cmd>wincmd j<cr>', { desc = 'Move to the window below' })
set('n', '<C-w>k', '<cmd>wincmd k<cr>', { desc = 'Move to the window above' })
set('n', '<C-w>l', '<cmd>wincmd l<cr>', { desc = 'Move to the window on the right' })
set('n', '<C-w>q', vim.cmd.close, { desc = 'Close the current window' })

-- tab
set('n', '<C-w><Tab>', vim.cmd.tabnew, { desc = 'Open a new tab' })
set('n', '<leader><Tab>', vim.cmd.tabnext, { desc = 'Move to the next tab' })
set('n', '<leader><S-Tab>', vim.cmd.tabprevious, { desc = 'Move to the previous tab' })

-- buffer
set('n', '<leader>x', require('custom.bdelete').close_buffer, { desc = 'Close the current buffer' })
set('n', '<Tab>', '<cmd>bnext<cr>', { desc = 'Move to the next buffer' })
set('n', '<S-Tab>', '<cmd>bprevious<cr>', { desc = 'Move to the previous buffer' })

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>q', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
