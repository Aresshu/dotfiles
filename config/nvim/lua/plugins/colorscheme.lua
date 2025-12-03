local opts = {
  theme = "dark",
  transparent = true,
  styles = {},
}

local function config()
  require("no-clown-fiesta").setup(opts) 
  vim.cmd('colorscheme no-clown-fiesta')
end

return {
  "aktersnurra/no-clown-fiesta.nvim",
  priority = 1000,
  config = config,
  lazy = false,
}

