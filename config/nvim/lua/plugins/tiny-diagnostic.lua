local function config()
  require('tiny-inline-diagnostic').setup()
  vim.diagnostic.config({ virtual_text = false })
end

return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = config,
}

