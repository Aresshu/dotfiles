local mason_opts = {
  ui = {
    border = "single",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

local capabilities = require('blink.cmp').get_lsp_capabilities()

local lsp_opts = {
  ensure_installed = {
    "lua_ls",
  },
  automatic_installation = true,
  handlers = {
    function (server_name)
      require("lspconfig")[server_name].setup{capabilities}
    end,

    ["lua_ls"] = function ()
      require("lspconfig").lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      }
    end,
  }
}

local function config()
  require("mason").setup(mason_opts)
  require("mason-lspconfig").setup(lsp_opts)
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = config
}
