local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-- mini.bufremove
map("n", "<C-S-D>", "<CMD>lua MiniBufremove.delete()<CR>", opts)

-- undotree
map("n", "<leader>u", "<CMD>UndotreeToggle<CR><CMD>UndotreeFocus<CR>", opts)

-- no neck pain (centre buffer)
map("n", "<leader>cc", "<CMD>NoNeckPain<CR>", opts)

-- [[ folding (ufo) ]]
map("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
map("n", "zk", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end, { desc = "Peek fold" })

-- [[ file navigation ]]

-- nvim-tree
map({ "i", "n" }, "<C-S-P>", vim.cmd.NvimTreeToggle, opts)
map("n", "<leader>fc", vim.cmd.NvimTreeFindFile, opts)

-- telescope
local telescope = require("telescope.builtin")
map("n", "<leader>ff", telescope.git_files, opts)
map("n", "<leader>fa", telescope.find_files, opts)
map("n", "<leader>b", telescope.buffers, opts)
map("n", "<leader>fg", function()
	telescope.grep_string({ search = vim.fn.input("Grep > ") })
end, opts)

-- harpoon
local harpoon_ui = require("harpoon.ui")
map("n", "<leader>h", function()
	harpoon_ui.nav_file(1)
end, opts)
map("n", "<leader>j", function()
	harpoon_ui.nav_file(2)
end, opts)
map("n", "<leader>k", function()
	harpoon_ui.nav_file(3)
end, opts)
map("n", "<leader>l", function()
	harpoon_ui.nav_file(4)
end, opts)
map("n", "<leader>;", function()
	harpoon_ui.nav_file(5)
end, opts)
map("n", "<leader>'", function()
	harpoon_ui.nav_file(6)
end, opts)
map("n", "<leader>e", function()
	harpoon_ui.toggle_quick_menu()
end, opts)
map("n", "<leader>a", function()
	require("harpoon.mark").add_file()
end, opts)

-- smart splits
map("n", "<M-h>", require("smart-splits").move_cursor_left, opts)
map("n", "<M-j>", require("smart-splits").move_cursor_down, opts)
map("n", "<M-k>", require("smart-splits").move_cursor_up, opts)
map("n", "<M-l>", require("smart-splits").move_cursor_right, opts)
map("n", "<M-H>", require("smart-splits").resize_left, opts)
map("n", "<M-J>", require("smart-splits").resize_down, opts)
map("n", "<M-K>", require("smart-splits").resize_up, opts)
map("n", "<M-L>", require("smart-splits").resize_right, opts)
map("n", "<M-C-S-H>", require("smart-splits").swap_buf_left, opts)
map("n", "<M-C-S-J>", require("smart-splits").swap_buf_down, opts)
map("n", "<M-C-S-K>", require("smart-splits").swap_buf_up, opts)
map("n", "<M-C-S-L>", require("smart-splits").swap_buf_right, opts)
