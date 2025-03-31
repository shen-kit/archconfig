return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = { "L3MON4D3/LuaSnip" },
		opts = {
			snippets = { preset = "luasnip" },
			-- tab/shift+tab = select or jump in snippet
			-- <C-e> = cancel
			-- <C-f>/<C-b> = scroll docs
			-- <C-p>/<C-n> = prev/next
			-- <C-k> = toggle signature
			keymap = {
				preset = "super-tab",
				["<CR>"] = { "accept", "fallback" },
			},
			appearance = { nerd_font_variant = "mono" },
			completion = { documentation = { auto_show = true } },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
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
