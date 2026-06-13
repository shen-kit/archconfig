local opt = vim.opt

-- Context
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 5
opt.signcolumn = 'yes'
opt.completeopt = { 'menuone', 'noselect', 'popup', 'fuzzy' }
opt.pumheight = 10 -- popup menu height

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Folds
opt.foldlevel = 99
opt.foldminlines = 1

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Sequences
opt.timeoutlen = 500

-- Scrolling
opt.mousescroll = 'ver:1,hor:1' -- scroll one line at a time

-- Appearance
opt.termguicolors = true
opt.linebreak = true -- don't wrap mid-word
opt.wrap = true
opt.breakindent = true -- indent wraps to same level as start
opt.breakindentopt = 'shift:2' -- indent wraps 2 spaces more than start
opt.showtabline = 2 -- always

-- Backup / history
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true
