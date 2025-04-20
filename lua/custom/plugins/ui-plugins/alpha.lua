return {
  {
    'goolord/alpha-nvim',
    lazy = false,
    priority = 1001,
    config = function()
      local max_sessions = 4
      local session_shortcuts = 'asdfghjkl'

      local max_line_len = 0 -- Store max session width

      local function last_sessions()
        local utils = require 'session_manager.utils'
        local sessions = utils.get_sessions()
        local temp_max_sessions = math.min(#sessions, max_sessions)

        max_line_len = math.min(max_line_len, 80) -- Cap at a reasonable maximum

        for i = 1, temp_max_sessions do
          local len = #sessions[i].dir:__tostring()
          max_line_len = math.max(max_line_len, len)
        end

        local lines_specs = {}

        for i = 1, temp_max_sessions do
          local session = sessions[i]
          local dirname_start, dirname_end = session.dir:__tostring():find '[^/]+$'
          local start_this_session = function()
            utils.load_session(session.filename, false)
          end

          table.insert(lines_specs, {
            type = 'button',
            val = '  ' .. session.dir:__tostring(),
            on_press = start_this_session,
            opts = {
              keymap = { 'n', session_shortcuts:sub(i, i), start_this_session },
              shortcut = string.format('[%s]  ', session_shortcuts:sub(i, i)),
              align_shortcut = 'left',
              position = 'center',
              hl = {
                { 'DashboardFooter', 1, dirname_start + 1 + 3 },
                { 'DashboardCenter', dirname_start + 1 + 3, dirname_end },
              },
              hl_shortcut = 'DashboardKey',
              cursor = 1,
              width = max_line_len + 3 + 5,
              shrink_margin = true,
            },
          })
        end

        table.insert(lines_specs, 1, {
          type = 'text',
          val = '  Recent Sessions' .. string.rep(' ', max_line_len - 7),
          opts = { hl = { { 'DashboardEmphasized', 0, 20 } }, position = 'center' },
        })

        table.insert(lines_specs, 1, {
          type = 'button',
          val = '󰅚  Quit NVIM',
          on_press = function()
            vim.cmd ':qa'
          end,
          opts = {
            keymap = { 'n', 'q', ':qa<CR>' },
            shortcut = '[q]  ',
            align_shortcut = 'left',
            position = 'center',
            hl_shortcut = 'DashboardKey',
            cursor = 1,
            width = max_line_len + 3 + 5,
            shrink_margin = true,
          },
        })

        table.insert(lines_specs, 1, {
          type = 'button',
          val = '  New file',
          on_press = function()
            vim.cmd ':ene | startinsert'
          end,
          opts = {
            keymap = { 'n', 'e', ':ene | startinsert<CR>' },
            shortcut = '[e]  ',
            align_shortcut = 'left',
            position = 'center',
            hl_shortcut = 'DashboardKey',
            cursor = 1,
            width = max_line_len + 3 + 5,
            shrink_margin = true,
          },
        })

        table.insert(lines_specs, 1, {
          type = 'text',
          val = '󰍜  Menu' .. string.rep(' ', max_line_len + 4),
          opts = { hl = { { 'DashboardEmphasized', 0, 20 } }, position = 'center' },
        })

        return lines_specs
      end

      require('alpha').setup {
        opts = {
          noautocmd = true,
        },
        layout = {
          {
            type = 'text',
            val = function()
              local pad = {}
              for _ = 1, ((vim.o.lines - 38) / 2) do
                table.insert(pad, '')
              end
              return pad
            end,
          },
          {
            type = 'text',
            opts = {
              position = 'center',
              hl = 'DashboardHeader',
            },
            val = {
              [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡀⠀⣠⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⢰⡀⢀⡆⠀⠀⠀⢀⡀⠀⠀⠀⠀⣆]],
              [[⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⣀⣠⠄⠸⡷⠄⢹⡧⠀⢀⡀⠀⠀⠍⠛⠀⣀⣤⠤⠖⢸⡷⠀⣿⠆⠀⢀⠀⢳⠀⠀⠀⠀⣿⠆⠀⠀⠀⠀⠀⠀⣀]],
              [[⠀⠀⠀⠀⠀⠀⠀⠀⠭⠛⢁⡠⠚⢉⠀⡖⡄⠀⢷⠀⠸⡇⠀⠀⠻⠀⠀⣠⠔⠋⢁⢠⢰⠀⠀⣧⠀⢸⡄⢠⠂⢀⢠⢠⠀⠴⡦⢸⡄⠀⡠⠁⠀⠷⡼⠁]],
              [[⠀⠀⠀⠀⢀⡀⡰⡆⠀⠀⠁⠀⠀⠀⠛⠛⠁⠀⢸⡆⠀⣷⠀⠀⠰⢄⠈⠁⠀⠀⠙⠞⠚⠀⠀⢻⠀⠸⡇⠺⠂⠸⡼⠾⠀⠁⠀⠘⣇⠀⣷⠂⠀⠀⣠⣄⡀⢸⣦]],
              [[⠀⠀⠀⠀⠈⠿⠇⠀⠀⡀⠾⢿⠿⣷⣶⣀⣀⣀⢸⡇⠀⢸⡀⠀⠿⠏⢀⣾⡿⣿⣶⣶⣶⣆⣀⢸⡇⠀⣇⠀⢀⠀⠀⣆⠀⢾⡆⠀⣿⠀⠀⠀⠀⠰⠶⠉⠀⠀⣷⡀]],
              [[⠀⠀⡐⠁⠀⠀⢁⠀⡼⠛⣦⣤⣤⡶⠛⠋⠛⠉⠁⡇⠀⢸⡇⠀⣤⡀⠀⠻⢦⣀⣠⣼⠿⠛⠁⠸⡇⠀⢻⢀⣾⠃⠀⢻⡄⠘⣧⠀⢻⠀⠀⣤⡄⠀⠀⡠⠀⣀⠘⡧]],
              [[⠀⠀⡟⠁⠀⡠⠛⠁⣧⡀⠈⢉⠋⠐⠟⠀⠀⠀⢀⡇⡠⠈⡇⠀⠉⠁⣠⣴⢿⢿⣧⠐⠛⢀⠀⣠⠇⢠⢸⢸⢿⠀⠀⢸⣇⠀⢘⡆⢸⠂⣼⠀⠻⠶⠞⠻⠾⠛⠿⠃]],
              [[⢀⠌⠠⠐⢋⣴⠾⠛⠛⠛⢇⠃⠀⠀⠛⣡⣴⠾⠛⢱⡥⠀⠁⢀⣴⡾⢋⠀⠃⠀⠁⠈⣻⣷⠟⠋⢀⠈⢮⡾⡘⢷⣶⢯⠚⠛⠛⠀⣨⣤⣾⢷⣦⠀⠀⢀⡀⠰⢷]],
              [[⠸⣦⣤⡴⠛⠁⣴⡴⢷⠀⢸⠀⢀⣠⡾⠋⢠⠃⢠⡀⢀⣠⣴⠟⠋⢠⡁⢸⠀⢀⣴⠟⠉⠀⠀⢠⣂⠀⠀⢀⡟⠃⠀⡆⠀⢀⣴⠞⠋⣰⠁⠀⣀⠔⠁⠁⣠⠴⠚⠋]],
              [[⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠁⠀⠀⠘⠃⠈⠛⠛⠉⠀⠀⠀⠘⠁⠈⠛⠛⠁⠀⠀⠀⠀⠈⠁⠀⠀⠓⠚⠀⠀⠘⠛⠋⠁⠀⠀⠛⠁⠀⠀⠀⠀⠐⠁]],
            },
          },
          {
            type = 'group',
            val = last_sessions,
            opts = { spacing = 1 },
          },
        },
      }
      local mocha = require('catppuccin.palettes').get_palette 'mocha'

      vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = mocha.rosewater, bold = true })
      vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = mocha.teal })
      vim.api.nvim_set_hl(0, 'DashboardKey', { fg = mocha.maroon, bold = true })
      vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = mocha.text })
      vim.api.nvim_set_hl(0, 'DashboardEmphasized', { fg = mocha.mauve, bold = true })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
