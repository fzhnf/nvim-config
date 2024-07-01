-- Find Word                    <C-n>                        |vm-find-word|
-- Next/Previous/Skip           n / N / q                    |vm-find-next|
-- Remove Region                Q                            |vm-remove-region|
-- Add Cursors Down/Up          <C-Down> / <C-Up>            |vm-add-cursors|
-- Add Cursor at Position       \\\                          |vm-add-cursor|
-- Select Right/Left            <S-Right>, <S-Left>          |vm-shift-select|
-- Select All Words             \\A                          |vm-select-all|
-- Slash motion                 g/                           |vm-slash|
-- Find with Regex              \\/                          |vm-regex-search|
-- Reselect Last                \\gS                         |vm-reselect-last|
-- Toggle Mappings              \\<Space>                    |vm-mappings-toggle|
-- Select Operator              s                            |vm-select-operator|
-- Find Operator                m                            |vm-find-operator|
-- Alignment                    \\a                          |vm-align|
-- Transposition                \\t                          |vm-transpose|
--
return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    keys = {
      { '<C-n>', desc = 'Find Word', silent = true },
      { '<C-Down>', desc = 'Add Cursors Down' },
      { '<C-Up>', desc = 'Add Cursors Up' },
      { '<S-Right>', desc = 'Select Right' },
      { '<S-Left>', desc = 'Select Left' },
      { '\\A', desc = 'Select All Words' },
      { 'g/', desc = 'Slash Motion' },
      { '\\/', desc = 'Find with Regex' },
      { '\\gS', desc = 'Reselect Last' },
      { '\\<Space>', desc = 'Toggle Mappings' },
      { '\\a', desc = 'Alignment' },
      { '\\t', desc = 'Transposition' },
    },
    config = function() end,
  },
}
