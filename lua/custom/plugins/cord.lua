return {
  {
    'vyfor/cord.nvim',
    build = './build',
    event = 'VeryLazy',
    opts = {
      usercmds = false, -- Enable user commands
      timer = {
        interval = 1500, -- Interval between presence updates in milliseconds (min 500)
        reset_on_idle = true, -- Reset start timestamp on idle
        reset_on_change = false, -- Reset start timestamp on presence change
      },
      editor = {
        tooltip = "(◕ ̮ ◕)っ❃🌸I'm💮so🪷stupid🌹🌺", -- Text to display when hovering over the editor's image
      },
      display = {
        show_time = true, -- Display start timestamp
        show_repository = true, -- Display 'View repository' button linked to repository url, if any
        show_cursor_position = true, -- Display line and column number of cursor's position
      },
      lsp = {
        show_problem_count = true, -- Display number of diagnostics problems
        severity = 1, -- 1 = Error, 2 = Warning, 3 = Info, 4 = Hint
        scope = 'workspace', -- buffer or workspace
      },
      idle = {
        enable = true, -- Enable idle status
        show_status = true, -- Display idle status, disable to hide the rich presence on idle
        timeout = 18000, -- Timeout in milliseconds after which the idle status is set, 0 to display immediately
        disable_on_focus = false, -- Do not display idle status when neovim is focused
        text = 'Idle', -- Text to display when idle
        tooltip = '💤', -- Text to display when hovering over the idle image
      },
      text = {
        viewing = 'Viewing {}', -- Text to display when viewing a readonly file
        editing = 'Editing {}', -- Text to display when editing a file
        file_browser = 'Browsing files in {}', -- Text to display when browsing files (Empty string to disable)
        plugin_manager = 'Managing plugins in {}', -- Text to display when managing plugins (Empty string to disable)
        lsp_manager = 'Configuring LSP in {}', -- Text to display when managing LSP servers (Empty string to disable)
        vcs = 'Committing changes in {}', -- Text to display when using Git or Git-related plugin (Empty string to disable)
        workspace = 'In {}', -- Text to display when in a workspace (Empty string to disable)
      },
      buttons = {
        {
          label = 'View Repository', -- Text displayed on the button
          url = 'git', -- URL where the button leads to ('git' = automatically fetch Git repository URL)
        },
        -- {
        --   label = 'View Plugin',
        --   url = 'https://github.com/vyfor/cord.nvim',
        -- }
      },
      assets = nil, -- Custom file icons, see the wiki*
      -- assets = {
      --   lazy = {                                 -- Vim filetype or file name or file extension = table or string
      --     name = 'Lazy',                         -- Optional override for the icon name, redundant for language types
      --     icon = 'https://example.com/lazy.png', -- Rich Presence asset name or URL
      --     tooltip = 'lazy.nvim',                 -- Text to display when hovering over the icon
      --     type = 2,                              -- 0 = language, 1 = file browser, 2 = plugin manager, 3 = lsp manager, 4 = vcs; defaults to language
      --   },
      --   ['Cargo.toml'] = 'crates',
      -- },
    },
  },
}
