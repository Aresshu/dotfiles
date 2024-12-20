return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- Customize the theme
    local auto_theme_custom = require('lualine.themes.auto')
    auto_theme_custom.normal.c.bg = 'none' -- Set background to transparent

    -- Setup lualine with the custom theme
    require('lualine').setup({
      options = {
        theme = auto_theme_custom,
      },
      disabled_filetypes = {
        statusline = { 'NvimTree' },
        winbar = {},
      },
    })
  end,
}

