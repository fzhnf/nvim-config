return {
  {
    'andweeb/presence.nvim',
    event = 'BufRead',
    config = function()
      require('presence').setup {
        enable_line_number = true,
        neovim_image_text = '(◕ ̮ ◕)っ❃🌸💮🪷🌹🌺🌻🌼🌷🪻✿',
        editing_text = "🌸I'm Editing %s🌼", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text = "🌸I'm Browsing %s🌼", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text = "🌸I'm Committing changes🌼", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "🌸I'm Managing plugins🌼", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text = "🌸I'm Reading %s🌼", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text = "🌸I'm Working on %s🌼", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text = '🌸Line %s out of %s🌼', -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      }
    end,
  },
}
