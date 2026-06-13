local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", "<C-i>", "<C-i>")

-- Diagnostics / quickfix / loclist
map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "grd", function()
	-- toggle qflist with all diagnostics for current buffer
	if 0 == vim.fn.getqflist({ winid = 0 }).winid then
		vim.diagnostic.setqflist()
	else
		vim.cmd.lclose()
	end
end)
map("n", "<leader>q", function()
	-- close loclist and qflist
	vim.cmd.lclose()
	vim.cmd.cclose()
end)

-- LSP
map("n", "gd", vim.lsp.buf.definition)

-- New lines
map("i", "<C-CR>", "<C-o>o") -- below
map("n", "<C-CR>", "o<ESC>")
map("i", "<C-S-CR>", "<C-o>O") -- above
map("n", "<C-S-CR>", "O<ESC>")

-- Move selection
map("x", "<C-M-j>", ":m '>+1<CR>gv=gv")
map("x", "<C-M-k>", ":m '<-2<CR>gv=gv")
map("n", "<C-M-k>", ":m -2<CR>")
map("n", "<C-M-j>", ":m +1<CR>")
map("i", "<C-M-k>", "<ESC>:m -2<CR>a")
map("i", "<C-M-j>", "<ESC>:m +1<CR>a")

-- Indents
map("x", "<", "<gv")
map("x", ">", ">gv")
map("n", "<", "<<")
map("n", ">", ">>")
map("i", "<S-Tab>", "<C-D>")

-- Buffers
map("n", "<leader><leader>", "<C-^>") -- alternate buffer
map("n", "[<leader>", "<CMD>bp<CR>")
map("n", "]<leader>", "<CMD>bn<CR>")

-- In-place cursor
map("n", "J", "mzJ`z")
map("n", "<C-u>", "15<C-u>zz") -- reduce scroll amount
map("n", "<C-d>", "15<C-d>zz")
map("x", "y", "ygv<ESC>")
map("x", "Y", '"+ygv<ESC>') -- yank to system clipboard

-- Scrolling
-- ctrl+scroll = 3 lines, shift+scroll = <C-d>/<C-u>
map({ "n", "v" }, "<C-ScrollWheelDown>", "3<C-e>")
map({ "n", "v" }, "<C-ScrollWheelUp>", "3<C-y>")
map({ "n", "v" }, "<M-ScrollWheelDown>", "<C-d>")
map({ "n", "v" }, "<M-ScrollWheelUp>", "<C-u>")
map("i", "<C-ScrollWheelDown>", "<C-x><C-e><C-e><C-e>")
map("i", "<C-ScrollWheelUp>", "<C-x><C-y><C-y><C-y>")
map("i", "<M-ScrollWheelDown>", "<C-o><C-d>")
map("i", "<M-ScrollWheelUp>", "<C-o><C-u>")

-- Save & exit
map({ "i", "n", "x" }, "<C-s>", "<CMD>update<CR>", { silent = false })

-- Search and replace word under cursor
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })
