return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    keys = {
      {
        '<leader>lf',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = 'n',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_format = 'fallback',
        timeout_ms = 500,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettierd', 'prettier' },
        typescript = { 'prettierd', 'prettier' },
        html = { 'prettierd', 'prettier' },
        css = { 'prettierd', 'prettier' },
        markdown = { 'prettierd', 'prettier' },
        yaml = { 'prettierd', 'prettier' },
        json = { 'prettierd', 'prettier' },
        python = {
          -- To fix auto-fixable lint errors.
          'ruff_fix',
          -- To run the Ruff formatter.
          'ruff_format',
          -- To organize the imports.
          'ruff_organize_imports',
        },
        rust = { 'rustfmt' },
        cpp = { 'clang_format' },
        bash = { 'shfmt' },
        fish = { 'fish_indent' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
