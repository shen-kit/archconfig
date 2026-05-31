local function map_markdown_keymaps(bufnr)
	vim.keymap.set("n", "<leader>tm", "<CMD>Mtm<CR>", { buffer = bufnr })
end

local function setup_markdown_keymaps()
	if vim.bo.filetype == "markdown" then
		map_markdown_keymaps(0)
	end

	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("markdown_table_mode_keymaps", { clear = true }),
		pattern = "markdown",
		callback = function(args)
			map_markdown_keymaps(args.buf)
		end,
	})
end

return {
	{
		"Kicamon/markdown-table-mode.nvim",
		ft = "markdown",
		config = function()
			require("markdown-table-mode").setup()
			setup_markdown_keymaps()
		end,
	},
}
