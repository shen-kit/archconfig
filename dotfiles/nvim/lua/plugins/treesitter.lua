return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"bash",
					"c",
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
					"typescript",
					"tsx",
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
			})
		end,
	},
}
