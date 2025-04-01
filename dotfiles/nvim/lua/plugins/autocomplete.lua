return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = { "L3MON4D3/LuaSnip" },
		opts = {
			sources = {
				default = function(_)
					if vim.bo.filetype == "markdown" then
						return { "snippets" }
					else
						return { "lsp", "path", "snippets", "buffer" }
					end
				end,
			},

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
			completion = { documentation = { auto_show = true } },
			fuzzy = { implementation = "prefer_rust" },
			signature = { enabled = true, window = { show_documentation = false } },
		},
		opts_extend = { "sources.default" },
	},

	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
}
