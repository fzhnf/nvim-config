return {
  'windwp/nvim-ts-autotag',
  ft = { 'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'svelte', 'vue' },
  event = 'bufRead',
  config = function()
    require('nvim-ts-autotag').setup {
      opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = true, -- Auto close on trailing </
      },
    }
  end,
}

-- vim: ts=2 sw=2 et
