local map = vim.keymap.set
return {
	"mrjones2014/smart-splits.nvim",
	lazy = false,
	config = function()
		map("n", "<M-h>", require("smart-splits").move_cursor_left)
		map("n", "<M-j>", require("smart-splits").move_cursor_down)
		map("n", "<M-k>", require("smart-splits").move_cursor_up)
		map("n", "<M-l>", require("smart-splits").move_cursor_right)
		map("n", "<M-H>", require("smart-splits").resize_left)
		map("n", "<M-J>", require("smart-splits").resize_down)
		map("n", "<M-K>", require("smart-splits").resize_up)
		map("n", "<M-L>", require("smart-splits").resize_right)
		map("n", "<M-C-S-H>", require("smart-splits").swap_buf_left)
		map("n", "<M-C-S-J>", require("smart-splits").swap_buf_down)
		map("n", "<M-C-S-K>", require("smart-splits").swap_buf_up)
		map("n", "<M-C-S-L>", require("smart-splits").swap_buf_right)
	end,
}
