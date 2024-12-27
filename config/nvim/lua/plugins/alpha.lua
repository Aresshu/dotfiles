return   {
  "goolord/alpha-nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    local builtin = require('telescope.builtin')

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
      dashboard.button("f", "  Find file", function()
        builtin.find_files()
      end),
      dashboard.button("r", "  Recent files", function()
        builtin.oldfiles()
      end),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    dashboard.section.footer.val = {
      "Alesh Nvim",
    }

    require("alpha").setup(dashboard.opts)
  end
}
