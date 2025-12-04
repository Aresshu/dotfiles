local opts = {
  ensure_installed = {
    "lua",
  },
  indent = { enable = true },
}

local function config()
  require("nvim-treesitter.configs").setup(opts)
end

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = config
}
