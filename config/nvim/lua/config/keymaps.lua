vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Clear highlights when searching
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Write file 
map('n', '<leader>w', '<cmd>:w<CR>')

-- Diagnostics
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics quickfix list' })

