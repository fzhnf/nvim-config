return {
  'nvim-flutter/flutter-tools.nvim',
  ft = 'dart',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'wa11breaker/flutter-bloc.nvim',
      dependencies = {
        'nvimtools/none-ls.nvim', -- Required for code actions
        ft = 'dart',
      },
      opts = {
        bloc_type = 'default', -- Choose from: 'default', 'equatable', 'freezed'
        use_sealed_classes = true,
        enable_code_actions = true,
      },
    },
  },
  opts = {},
}
