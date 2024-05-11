return {
    "neovim/nvim-lspconfig",

    config = function()
        local lspconfig = require("lspconfig")

        -- Rust_analyzer
        lspconfig.rust_analyzer.setup ({})

        -- Lua_lsp
        lspconfig.lua_ls.setup({})

        -- Pylsp
        lspconfig.pylsp.setup({})

        -- Gopls
        lspconfig.gopls.setup({})

        -- Keymaps
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
}

