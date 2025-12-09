local no_clown_opts = {
  theme = "dark",
  transparent = true,
  styles = {},
}

local function config()
  require("no-clown-fiesta").setup(no_clown_opts)

  vim.cmd('colorscheme no-clown-fiesta')
end

return {
  "aktersnurra/no-clown-fiesta.nvim",
  priority = 1000,
  config = config,
  lazy = false,
}
