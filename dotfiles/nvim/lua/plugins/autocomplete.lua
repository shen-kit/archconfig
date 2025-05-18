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
						return { "lazydev", "lsp", "path", "snippets", "buffer" }
					end
				end,
				min_keyword_length = 1,
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100, -- prioritise lazydev completions
					},
				},
			},
			cmdline = { enabled = false },
			snippets = { preset = "luasnip" },
			-- tab/shift+tab = select or jump in snippet
			-- <C-e> = cancel
			-- <C-f>/<C-b> = scroll docs
			-- <C-p>/<C-n> = prev/next
			-- <C-k> = toggle signature
			keymap = { preset = "enter" },
			appearance = { nerd_font_variant = "mono" },
			completion = {
				menu = { draw = { treesitter = { "lsp" } } },
				documentation = { auto_show = true },
				ghost_text = { enabled = false },
			},
			fuzzy = { implementation = "prefer_rust" },
			signature = { enabled = true, window = { show_documentation = true } },
		},
		opts_extend = { "sources.default" },
	},

	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			-- friendly snippets
			require("luasnip.loaders.from_vscode").lazy_load({ exclude = { "markdown", "all" } })
			-- custom snippets
			require("luasnip.loaders.from_snipmate").lazy_load({ paths = { ".config/snippets" } })
		end,
	},

	-- for nvim configuration
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
