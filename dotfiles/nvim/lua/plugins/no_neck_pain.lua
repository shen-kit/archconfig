return {
	{
		"shortcuts/no-neck-pain.nvim",
		config = function()
			vim.keymap.set("n", "<leader>cc", "<CMD>NoNeckPain<CR>")
		end,
	},
}
