require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.bufremove").setup()
require("mini.cursorword").setup({ delay = 500 })
require("mini.comment").setup({ mappings = { comment_visual = "<C-/>" } })
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
