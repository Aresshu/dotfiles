local opt = vim.opt

-- Sync OS Clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Indentation
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Line Wrapping
opt.wrap = true

-- Number
opt.number = true
opt.relativenumber = false

-- Save Undo History
opt.undofile = true

