local map = vim.keymap.set

return {
	{
		"echasnovski/mini.ai",
		version = false,
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "<leader>sa",
					delete = "<leader>sd",
					replace = "<leader>sr",
					-- disable
					find = "",
					find_left = "",
					highlight = "",
					update_n_lines = "",
				},
				-- surround each line in blockwise mode
				respect_selection_type = true,
			})
		end,
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		config = function()
			local bufremove = require("mini.bufremove")
			bufremove.setup()
			map("n", "<C-S-D>", bufremove.delete)
		end,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		config = function()
			require("mini.comment").setup({ mappings = { comment_visual = "<C-/>" } })
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.cursorword",
		version = false,
		config = function()
			require("mini.cursorword").setup({ delay = 500 })
		end,
	},
}
