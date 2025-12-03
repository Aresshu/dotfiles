local opts = {}

local function config()
  require("oil").setup(opts)
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end

return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-mini/mini.icons", opts = {} },
  config = config,
}
