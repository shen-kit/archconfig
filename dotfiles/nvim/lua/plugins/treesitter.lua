return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"html",
				"java",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			sync_install = false, -- install synchronously
			auto_install = true, -- for missing parsers
			highlight = {
				enable = true,
				-- disable treesitter for files over 256MB as it gets slow
				disable = function(_, bufnr)
					local buf_name = vim.api.nvim_buf_get_name(bufnr)
					local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
					return file_size > 256 * 1024
				end,
			},
			indent = { enable = true },
		},
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-context",
				opts = {
					max_lines = 3,
					multiline_threshold = 1,
					min_window_height = 20,
				},
				keys = {
					{
						"[c",
						function()
							-- Jump to previous change when in diffview.
							if vim.wo.diff then
								return "[c"
							else
								vim.schedule(function()
									require("treesitter-context").go_to_context()
								end)
								return "<Ignore>"
							end
						end,
						desc = "Jump to upper context",
						expr = true,
					},
				},
			},
		},
	},
}
