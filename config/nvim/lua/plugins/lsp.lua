return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'saghen/blink.cmp',
  },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    require("mason").setup({
      ui = {
        border = "single",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "rust_analyzer", "zls", "ts_ls" },
      automatic_installation = true,
      handlers = {
        function (server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup { capabilities }
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

        ["rust_analyzer"] = function ()
          require("lspconfig").rust_analyzer.setup({
            settings = {
              ["rust-analyzer"] = {
                checkOnSave = {
                  command = "clippy", -- Run clippy on save
                },
                diagnostics = {
                  enable = true,
                  experimental = {
                    enable = true,
                  },
                },
              },
            },
         })
        end,

        ['zls'] = function ()
          require('lspconfig').zls.setup {}
        end,

        ["ts_ls"] = function ()
          require("lspconfig").ts_ls.setup {}
        end,


      }
    })
  end,
}
