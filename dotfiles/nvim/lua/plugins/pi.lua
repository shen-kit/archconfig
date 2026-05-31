return {
	{
		"pablopunk/pi.nvim",
		config = function()
			require("pi").setup({
				thinking = "off",
			})

			vim.keymap.set("n", "<leader>ai", ":PiAsk<CR>")
			vim.keymap.set("v", "<leader>ai", ":PiAskSelection<CR>")
		end,
	},
}
