return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = 'BufWrite',
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
        lsp_format = 'fallback',
        timeout_ms = 500,
      },
      formatters_by_ft = {
        c = { 'clang_format' },
        cpp = { 'clang_format' },
        lua = { 'stylua' },
        python = {
          'ruff_fix',
          'ruff_format',
          'ruff_organize_imports',
        },
        javascript = { 'biome' },
        javascriptreact = { 'biome' },
        typescript = { 'biome' },
        typescriptreact = { 'biome' },
        astro = { 'biome' },
        html = { 'prettierd' },
        css = { 'prettierd' },
        json = { 'biome' },
        rust = { 'rustfmt' },
        sql = { 'sqlfluff' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
