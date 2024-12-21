return {
  -- 'rebelot/kanagawa.nvim',
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --   require('kanagawa').setup({
  --     transparent = false,
  --     theme = "dragon",
  --     colors = {
  --       theme = {
  --         all = {
  --           ui = {
  --             bg_gutter = "none"
  --           }
  --         }
  --       }
  --     },
  --
  --     overrides = function(colors)
  --       local theme = colors.theme
  --       return {
  --         NormalFloat = { bg = "none" },
  --         FloatBorder = { bg = "none" },
  --         FloatTitle = { bg = "none" },
  --
  --         TelescopeTitle = { fg = theme.ui.special, bold = true },
  --         TelescopePromptNormal = { bg = "none" },
  --         TelescopePromptBorder = { bg = "none" },
  --         TelescopeResultsNormal = { bg = "none" },
  --         TelescopeResultsBorder = { bg = "none" },
  --         TelescopePreviewNormal = { bg = "none" },
  --         TelescopePreviewBorder = { bg = "none" },
  --       }
  --     end,
  --
  --   })
  --   vim.cmd.colorscheme('kanagawa')
  -- end
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      terminal_colors = true,
      transparent_mode = true,
    })
    vim.o.background = "dark"
    vim.cmd("colorscheme gruvbox")
  end
}

