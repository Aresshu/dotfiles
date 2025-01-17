return {
  "ficcdaf/ashen.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require('ashen').setup({
      transparent = true,
    })
    vim.cmd("colorscheme ashen")
  end,
}
-- return {
--   "aktersnurra/no-clown-fiesta.nvim",
--   priority = 1000,
--   lazy = false,
--   config = function()
--     require('no-clown-fiesta').setup({
--       transparent = true,
--       styles = {},
--     })
    -- vim.cmd('colorscheme no-clown-fiesta')
--   end,
-- }
--
-- "ellisonleao/gruvbox.nvim",
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --   require("gruvbox").setup({
  --     terminal_colors = true,
  --     transparent_mode = true,
  --   })
  --   vim.o.background = "dark"
  --   vim.cmd("colorscheme gruvbox")
  -- end

