return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  config = function()

    require('kanagawa').setup({
      transparent = true,
      theme = "dragon",
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      },

      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = "none" },
          TelescopePromptBorder = { bg = "none" },
          TelescopeResultsNormal = { bg = "none" },
          TelescopeResultsBorder = { bg = "none" },
          TelescopePreviewNormal = { bg = "none" },
          TelescopePreviewBorder = { bg = "none" },
        }
      end,

    })
    vim.cmd.colorscheme('kanagawa')
  end
}
