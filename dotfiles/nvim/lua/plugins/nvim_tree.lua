return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("nvim-tree").setup({
				view = { width = 36 },
				filters = { dotfiles = false },
				actions = {
					open_file = {
						quit_on_open = true,
						window_picker = { enable = false },
					},
				},
				hijack_directories = { enable = true },
			})

			local map = vim.keymap.set
			map({ "i", "n" }, "<C-S-P>", vim.cmd.NvimTreeToggle)
			map("n", "<leader>fc", vim.cmd.NvimTreeFindFile)
		end,
	},
}
