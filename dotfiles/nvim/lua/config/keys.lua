local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- [[ diagnostics / qflist / loclist ]]
map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "grd", function() -- toggle qflist with all diagnostics for current buffer
	if 0 == vim.fn.getqflist({ winid = 0 }).winid then -- qflist not open
		vim.diagnostic.setqflist()
	else
		vim.cmd.lclose()
	end
end)
map("n", "<leader>q", function() -- close loclist and qflist
	vim.cmd.lclose()
	vim.cmd.cclose()
end)

-- [[ new lines ]]
map("i", "<C-CR>", "<C-o>o") -- below
map("n", "<C-CR>", "o<ESC>")
map("i", "<C-S-CR>", "<C-o>O") -- above
map("n", "<C-S-CR>", "O<ESC>")

-- [[ move selection ]]
-- up/down
map("x", "<C-M-j>", ":m '>+1<CR>gv=gv")
map("x", "<C-M-k>", ":m '<-2<CR>gv=gv")
map("n", "<C-M-k>", ":m -2<CR>")
map("n", "<C-M-j>", ":m +1<CR>")
map("i", "<C-M-k>", "<ESC>:m -2<CR>a")
map("i", "<C-M-j>", "<ESC>:m +1<CR>a")

-- [[ indents ]]
map("x", "<", "<gv")
map("x", ">", ">gv")
map("n", "<", "<<")
map("n", ">", ">>")
map("i", "<S-Tab>", "<C-D>")

-- [[ buffers ]]
map("n", "<leader><leader>", "<C-^>") -- alternate buffer
map("n", "[<leader>", "<CMD>bp<CR>")
map("n", "]<leader>", "<CMD>bn<CR>")

-- [[ in-place cursor ]]
map("i", "<C-/>", "<ESC>my:norm gcc<CR>`ya", { remap = true })
map("n", "<C-/>", "mygcc `y", { remap = true })
map("n", "J", "mzJ`z")
-- yank
map("x", "y", "ygv<ESC>")
map("x", "Y", '"+ygv<ESC>') -- to system clipboard

-- [[ scrolling ]]
-- reduce scroll amt
map("n", "<C-u>", "15<C-u>")
map("n", "<C-d>", "15<C-d>")
-- ctrl+scroll = 3 lines, shift+scroll = <C-d>/<C-u>
map({ "n", "v" }, "<C-ScrollWheelDown>", "3<C-e>")
map({ "n", "v" }, "<C-ScrollWheelUp>", "3<C-y>")
map({ "n", "v" }, "<M-ScrollWheelDown>", "<C-d>")
map({ "n", "v" }, "<M-ScrollWheelUp>", "<C-u>")
map("i", "<C-ScrollWheelDown>", "<C-x><C-e><C-e><C-e>")
map("i", "<C-ScrollWheelUp>", "<C-x><C-y><C-y><C-y>")
map("i", "<M-ScrollWheelDown>", "<C-o><C-d>")
map("i", "<M-ScrollWheelUp>", "<C-o><C-u>")

-- [[ save & exit ]]
map({ "i", "n", "x" }, "<C-s>", "<CMD>w<CR>", { silent = false })

-- [[ misc ]]

-- search and replace the word under the cursor
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })
