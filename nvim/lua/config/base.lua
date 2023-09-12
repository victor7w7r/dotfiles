local opt = vim.opt

opt.autoindent = true
opt.cindent = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.encoding = 'utf-8'
opt.expandtab = true
opt.fileencoding = 'utf-8'
opt.history = 50
opt.ignorecase = true
opt.list = true
opt.number = true
opt.numberwidth = 2
opt.scrolloff = 8
opt.shell = 'fish'
opt.shiftwidth = 2
opt.showcmd = true
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.tabstop = 2
opt.textwidth = 300
opt.shiftwidth = 2
opt.softtabstop = -1
opt.wildignore:append { '*/node_modules/*' }
opt.wrap = true

-- backup & update
opt.timeoutlen = 500
opt.updatetime = 200
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.swapfile = false

vim.scriptencoding = 'utf-8'
vim.wo.number = true

vim.g["termguicolors"] = true
vim.g["default_terminal"] = "xterm-256color"