return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = {
    theme = 'hyper',
    config = {
      week_header = {
        enable = true,
      },
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope find_files cwd=~/',
          key = 'd',
        },
        -- {
        --   desc = ' Daily Note',
        --   group = 'DiagnosticHint',
        --   action = 'ObsidianToday',
        --   key = 'o',
        -- },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
      },
    }
  },
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
