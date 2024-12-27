return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()

    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        'bash',
        'lua',
        'rust',
        'zig',
      },

      sync_install = false,

      auto_install = false,

      highlight = { enable = true },

      indent = { enable = true },

    })
  end
}