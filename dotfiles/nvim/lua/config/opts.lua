-- ============================================================
--                       Global Options
-- ============================================================

local g            = vim.g
-- g.markdown_folding = 1

-- ============================================================
--                       Local Options
-- ============================================================

local opt          = vim.opt

-- [[ history / backup ]]
opt.swapfile       = false
opt.backup         = false
opt.undodir        = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile       = true

-- [[ context ]]
opt.number         = true
opt.relativenumber = true
opt.scrolloff      = 5
opt.sidescrolloff  = 5
opt.signcolumn     = 'yes'
opt.completeopt    = { 'menu', 'menuone', 'noselect' }
opt.pumheight      = 7

-- [[ theme / appearance ]]
opt.termguicolors  = true
opt.linebreak      = true      -- only wrap after a space
opt.textwidth      = 9999      -- don't hard-wrap at 80 chars, override in ftplugin/<filetype>.lua for specific files
opt.wrap           = true      -- whether to wrap at edges of screen
opt.breakindent    = true      -- indent wrapped text to the same level as the first line
opt.breakindentopt = "shift:2" -- indent 2 spaces in from the start of the line
opt.showtabline    = 2         -- always show
opt.conceallevel   = 0         -- show characters as they are
vim.diagnostic.config({ virtual_text = false, signs = true, underline = false })

-- [[ indents ]]
opt.tabstop        = 2
opt.softtabstop    = 2
opt.shiftwidth     = 2
opt.expandtab      = true
opt.smartindent    = true

-- [[ folding ]]
opt.foldmethod     = "expr"
opt.foldexpr       =
"v:lnum >= line('$') || v:lnum == 0  ? '0'  :  indent(v:lnum+1) > indent(v:lnum)   ? 'a1' :  indent(v:lnum+1) < indent(v:lnum)   ? 's1' :  indent(v:lnum) == 0 ? '0' : '=' "
opt.foldtext       =
[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
opt.fillchars      = "fold: "
opt.foldnestmax    = 3
opt.foldminlines   = 1
opt.foldlevelstart = 99

-- [[ search ]]
opt.ignorecase     = true
opt.smartcase      = true  -- case sensitive if search contains capitals
opt.hlsearch       = false -- highlight all occurrences?
opt.incsearch      = true  -- incremental search (update while typing)

-- [[ splits ]]
opt.splitright     = true -- split right instead of left by default
opt.splitbelow     = true -- split down instead of up by default

-- [[ sequences ]]
opt.timeoutlen     = 500

-- [[ misc ]]
opt.updatetime     = 50
opt.path:append '**'
opt.mousescroll    = 'ver:1,hor:1' -- scroll one line at a time (smoother scrolling)

-- [[ sessions ]]
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
