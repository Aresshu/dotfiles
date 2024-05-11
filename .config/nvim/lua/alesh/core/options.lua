vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Color-scheme
opt.termguicolors = true --leave for now check later (possibly makes colors bad)
opt.background = "dark"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Backspace
opt.backspace = "indent,eol,start"

-- Split windows
opt.splitright = true
opt.splitbelow = true
