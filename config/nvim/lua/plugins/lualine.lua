-- I need to figure out a better look for this... for now this works

local function config()
  local auto_theme_custom = require("lualine.themes.auto")
  auto_theme_custom.normal.c.bg = "none"
  require("lualine").setup({
    options = {
      theme = auto_theme_custom,
    },
    disabled_filetypes = {
      statusline = { 'NvimTree' },
      winbar = {},
    },
  })
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = config
}
