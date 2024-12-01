return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    keys = {
      {
        '<leader>lf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
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
