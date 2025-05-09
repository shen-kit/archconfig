return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
		---@module 'blink.cmp'
		opts = {
			sources = {
				default = function(_)
					if vim.bo.filetype == "markdown" then
						return { "snippets" }
					else
						return { "lsp", "path", "snippets" } -- "buffer"
					end
				end,
				min_keyword_length = 1,
			},
			cmdline = { enabled = false },

			snippets = { preset = "luasnip" },
			keymap = {
				-- tab/shift+tab = select or jump in snippet
				-- <C-e> = cancel
				-- <C-f>/<C-b> = scroll docs
				-- <C-p>/<C-n> = prev/next
				-- <C-k> = toggle signature
				preset = "super-tab",
				["<CR>"] = { "accept", "fallback" },
			},
			appearance = { nerd_font_variant = "mono" },
			completion = {
				menu = { draw = { treesitter = { "lsp" } } },
				documentation = { auto_show = true },
				ghost_text = { enabled = vim.g.ai_cmp },
			},
			fuzzy = { implementation = "prefer_rust" },
			signature = { enabled = true, window = { show_documentation = false } },
		},
		opts_extend = { "sources.default" },
	},
}
