vim.g.mapleader = " "

local keymap = vim.keymap

--keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go previous diagnostics" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go next diagnostics" })


-- Window management

-- Split windows can be added later if no tmux 
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "New Tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close Tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next Tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Previous Tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Current Buffer In New Tab" })
