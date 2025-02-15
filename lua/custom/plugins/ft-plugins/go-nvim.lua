return {
  'ray-x/go.nvim',
  opts = {},
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
