local map = vim.keymap.set
local opts = { silent = true, noremap = true }
local opt_loud = { silent = false, noremap = true }

map("i", "jk", "<ESC>", opts)

-- [[ diagnostics / qflist / loclist ]]
map("n", "<leader>d", vim.diagnostic.open_float, opts)
map("n", "grd", function() -- toggle qflist with all diagnostics for current buffer
	if 0 == vim.fn.getqflist(0, { winid = 0 }).winid then
		vim.diagnostic.setqflist()
	else
		vim.cmd.lclose()
	end
end, opts)
map("n", "<leader>q", function() -- close loclist and qflist
	vim.cmd.lclose()
	vim.cmd.cclose()
end, opts)

-- [[ new lines ]]
map("i", "<C-CR>", "<C-o>o", opts) -- below
map("n", "<C-CR>", "o<ESC>", opts)
map("i", "<C-S-CR>", "<C-o>O", opts) -- above
map("n", "<C-S-CR>", "O<ESC>", opts)

-- [[ move selection ]]
-- up/down
map("x", "<C-M-j>", ":m '>+1<CR>gv=gv", opts)
map("x", "<C-M-k>", ":m '<-2<CR>gv=gv", opts)
map("n", "<C-M-k>", ":m -2<CR>", opts)
map("n", "<C-M-j>", ":m +1<CR>", opts)
map("i", "<C-M-k>", "<ESC>:m -2<CR>a", opts)
map("i", "<C-M-j>", "<ESC>:m +1<CR>a", opts)

-- [[ indents ]]
map("x", "<", "<gv", opts)
map("x", ">", ">gv", opts)
map("n", "<", "<<", opts)
map("n", ">", ">>", opts)
map("i", "<S-Tab>", "<C-D>", opts)

-- [[ buffers ]]
map("n", "<leader><leader>", "<C-^>", opts) -- alternate buffer
map("n", "[<leader>", "<CMD>bp<CR>", opts)
map("n", "]<leader>", "<CMD>bn<CR>", opts)

-- [[ in-place cursor ]]
map("i", "<C-/>", "<ESC>my:norm gcc<CR>`ya", { remap = true })
map("n", "<C-/>", "mygcc `y", { remap = true })
map("n", "J", "mzJ`z", opts)
-- yank
map("x", "y", "ygv<ESC>", opts)
map("x", "Y", '"+ygv<ESC>', opts) -- to system clipboard

-- [[ scrolling ]]
-- reduce scroll amt
map("n", "<C-u>", "15<C-u>", opts)
map("n", "<C-d>", "15<C-d>", opts)
-- ctrl+scroll = 3 lines, shift+scroll = <C-d>/<C-u>
map({ "n", "v" }, "<C-ScrollWheelDown>", "3<C-e>", opts)
map({ "n", "v" }, "<C-ScrollWheelUp>", "3<C-y>", opts)
map({ "n", "v" }, "<M-ScrollWheelDown>", "<C-d>", opts)
map({ "n", "v" }, "<M-ScrollWheelUp>", "<C-u>", opts)
map("i", "<C-ScrollWheelDown>", "<C-x><C-e><C-e><C-e>", opts)
map("i", "<C-ScrollWheelUp>", "<C-x><C-y><C-y><C-y>", opts)
map("i", "<M-ScrollWheelDown>", "<C-o><C-d>", opts)
map("i", "<M-ScrollWheelUp>", "<C-o><C-u>", opts)

-- [[ save & exit ]]
map({ "i", "n", "x" }, "<C-s>", "<CMD>w<CR>", opt_loud)

-- [[ misc ]]

-- search and replace the word under the cursor
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opt_loud)
