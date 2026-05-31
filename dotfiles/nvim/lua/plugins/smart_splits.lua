return {
	"mrjones2014/smart-splits.nvim",
	lazy = false,
	config = function()
		local map = vim.keymap.set
		local splits = require("smart-splits")

		map("n", "<M-h>", splits.move_cursor_left)
		map("n", "<M-j>", splits.move_cursor_down)
		map("n", "<M-k>", splits.move_cursor_up)
		map("n", "<M-l>", splits.move_cursor_right)
		map("n", "<M-H>", splits.resize_left)
		map("n", "<M-J>", splits.resize_down)
		map("n", "<M-K>", splits.resize_up)
		map("n", "<M-L>", splits.resize_right)
		map("n", "<M-C-S-H>", splits.swap_buf_left)
		map("n", "<M-C-S-J>", splits.swap_buf_down)
		map("n", "<M-C-S-K>", splits.swap_buf_up)
		map("n", "<M-C-S-L>", splits.swap_buf_right)
	end,
}
