local map = vim.keymap.set
local telescope_builtin = require('telescope.builtin')

-- General Keymaps
-- Clear highlights when searching
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Write file 
map('n', '<leader>w', '<cmd>:w<CR>')

-- Diagnostics
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics quickfix list' })

-- Telescope Keymaps
map('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope Find Files' })
map('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Telescope Live Grep' })
map('n', '<leader>fc', telescope_builtin.grep_string, { desc = 'Telescope Grep String' })
map('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope Find Buffers' })
map('n', '<leader>fk', telescope_builtin.keymaps, { desc = 'Telescope Find Keymaps' })
map('n', '<leader>fr', telescope_builtin.oldfiles, { desc = 'Telescope Find Old Files' })
map('n', '<leader>fs', telescope_builtin.resume, { desc = 'Telescope Resume Last Search' })

-- Oil Keymaps
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
