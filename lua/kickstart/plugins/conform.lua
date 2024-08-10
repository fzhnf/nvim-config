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
        python = {
          -- To fix auto-fixable lint errors.
          'ruff_fix',
          -- To run the Ruff formatter.
          'ruff_format',
          -- To organize the imports.
          'ruff_organize_imports',
        },
        javascript = { 'biome' },
        typescript = { 'biome' },
        html = { 'biome' },
        css = { 'biome' },
        json = { 'biome' },
        rust = { 'rustfmt' },
        cpp = { 'clang_format' },
        bash = { 'shfmt' },
        fish = { 'fish_indent' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
