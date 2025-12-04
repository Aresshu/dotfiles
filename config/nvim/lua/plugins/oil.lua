local opts = {}

local function keymaps()
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end

local function config()
  require("oil").setup(opts)
  keymaps()
end

return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-mini/mini.icons", opts = {} },
  config = config,
}
