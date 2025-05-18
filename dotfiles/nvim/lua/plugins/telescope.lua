return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- faster fzf
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_config = { horizontal = { width = 0.95 } },
					mappings = {
						n = {
							["d"] = require("telescope.actions").delete_buffer,
							["q"] = require("telescope.actions").close,
						},
					},
				},
				-- required for fzf-native
				extensions = {
					fzf = {
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			require("telescope").load_extension("fzf") -- required for fzf-native

			local map = vim.keymap.set
			local t = require("telescope.builtin")

			map("n", "<leader>ff", t.find_files) -- files in cwd
			map("n", "<leader>b", t.buffers) -- buffers
			map("n", "fh", t.help_tags) -- help
			map("n", "<leader>fp", t.resume) -- previous picker
			-- live multi-grep
			local multigrep = require("config.telescope.multigrep")
			map("n", "<leader>fg", multigrep.run)
			-- nvim config files
			map("n", "<leader>fn", function()
				t.find_files({ cwd = vim.fn.stdpath("config") })
			end)
		end,
	},
}
