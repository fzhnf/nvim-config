return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = 'BufWritePost',
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        python = { 'ruff', 'mypy' },
        clojure = {},
        dockerfile = {},
        inko = {},
        janet = {},
        jsonlint = {},
        markdown = {},
        rst = {},
        ruby = {},
        terraform = {},
        text = {},
      }
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufRead', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
