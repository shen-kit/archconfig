local o = vim.opt

-- context
o.number = true
o.relativenumber = true
o.scrolloff = 5
o.sidescrolloff = 5
o.signcolumn = "yes"
o.completeopt = { "menuone", "noselect", "popup", "fuzzy" }
o.pumheight = 10 -- popup menu height

-- indents
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

-- folds
o.foldmethod = "expr"
o.foldexpr =
	"v:lnum >= line('$') || v:lnum == 0  ? '0'  :  indent(v:lnum+1) > indent(v:lnum)   ? 'a1' :  indent(v:lnum+1) < indent(v:lnum)   ? 's1' :  indent(v:lnum) == 0 ? '0' : '=' "
o.foldtext =
	[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
o.fillchars = "fold: "
o.foldnestmax = 3
o.foldminlines = 1
o.foldlevelstart = 99

-- search
o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

-- splits
o.splitright = true
o.splitbelow = true

-- sequences
o.timeoutlen = 500

-- scrolling
o.mousescroll = "ver:1,hor:1" -- scroll one line at a time

-- appearance
o.termguicolors = true
o.linebreak = true -- don't wrap mid-word
o.wrap = true
o.breakindent = true -- indent wraps to same level as start
o.breakindentopt = "shift:2" -- indent wraps 2 spaces more than start
o.showtabline = 2 -- always

-- backup / history
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true
