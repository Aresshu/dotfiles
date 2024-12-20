return   {
  "goolord/alpha-nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "      ⠀⠀⠀⠀⢀⡠⠤⠒⠈⠉⠉⠉⠉⠉⠉⠐⠢⢄⡀⠀⠀⠀⠀⠀⠀      ",
      "⠀⠀⠀⠀⠀⠀⠀⠀⣠⠖⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⡠⠞⡁⠀⠀⠀⠀⣀⣠⢠⣀⣀⣀⣤⣠⣀⡀⠀⠀⢠⣀⠑⡄⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⣰⠃⠀⣷⣶⡀⠀⣹⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⢿⣶⣿⣿⣤⠘⡆⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⢰⠇⠀⢠⡹⣿⣿⣿⣿⡿⠟⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠑⠛⠦⣄⡀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⢸⠀⠀⢠⣽⡿⠟⠋⠠⠂⣀⣤⣶⣾⣿⣿⣿⣿⡿⢿⣶⣦⣄⢀⣄⡀⠀⣤⡍⠓⢦⡀⠀",
      "⠀⠀⠀⠀⢸⠀⡨⢞⣁⣴⣶⣶⣶⣿⣿⣿⡿⠃⡿⢻⣿⡿⠁⠈⢻⡍⢿⣿⣝⡻⢿⣅⠀⠀⠀⠙⡄",
      "⠀⠀⠀⠀⣨⠟⠁⢺⡿⢋⣾⣿⣿⣿⣿⡿⠁⢰⠃⢸⡿⠁⠀⠀⠸⡇⠀⢿⣿⣿⣦⣉⠀⠀⠀⠀⢸",
      "⠀⠀⣠⠞⠁⠀⠀⠀⣠⣿⣿⣿⡿⢹⣿⠁⠀⠈⢀⡞⢀⣀⡀⠀⠀⠁⠀⠘⣿⣿⣅⣤⣄⠀⠀⢀⡞",
      "⠀⢰⠃⠀⣠⣄⠀⢰⣿⣿⣿⣿⠃⢸⠷⣤⣀⣀⣈⣡⠟⢇⣁⣀⣤⣂⡀⠀⢻⣿⣿⣿⣿⠀⣠⠎⠀",
      "⢠⡇⠀⢰⣿⣟⠀⣾⣿⣿⣿⣿⠀⠺⠿⠿⠬⠛⠿⠋⠀⠞⠙⣿⣿⣿⡋⠀⣾⣿⣤⣿⡡⠞⠁⠀⠀",
      "⠈⡇⠀⢸⣿⣿⣳⢿⣿⣿⢿⡟⠀⠀⠀⠀⢀⡀⠰⠦⠀⢸⠿⠢⢍⡉⠁⢰⣳⡯⠛⠉⠀⠀⠀⠀⠀",
      "⠀⠱⡀⢼⣿⣿⣯⠼⢿⡹⢯⣿⠀⠀⠀⠔⠉⠀⢀⣀⣀⣀⡀⠀⠀⠱⠀⢸⠏⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠳⣌⡛⠛⣧⣤⣼⣏⣙⣾⣇⠀⠀⢀⠴⠊⢁⡤⡤⣤⣈⠑⠲⢄⠀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠉⠉⠁⠉⠀⠀⠀⠀⠈⠳⣤⣄⡤⠊⠁⠘⠀⠇⠛⢉⣲⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠿⣽⣿⣶⣾⣿⢿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⠀⠀⠈⠙⣿⣿⡼⣧⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣶⣿⣿⣧⠀⠀⠀⠀⠈⠉⠁⠈⢙⣿⣷⣶⣤⣄⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⢴⣾⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    dashboard.section.footer.val = {
      "Alesh Nvim",
    }

    require("alpha").setup(dashboard.opts)
  end
}

