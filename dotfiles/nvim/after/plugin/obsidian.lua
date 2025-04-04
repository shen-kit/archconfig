require("obsidian").setup({
	workspaces = { { name = "obsidian", path = "~/gDrive/1_obsidian" } },
	new_notes_location = "current_dir",
	preferred_link_style = "wiki",
	wiki_link_func = "use_alias_only",
	open_app_foreground = true,
	disable_frontmatter = true,
	mappings = {
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
	},
	note_path_func = function(spec)
		return (spec.dir / spec.title):with_suffix(".md")
	end,
	attachments = { -- pasting images
		img_folder = "./obsidian_attachments",
		img_text_func = function(client, path)
			path = client:vault_relative_path(path) or path
			return string.format("![[%s]]", path.name) -- vimwiki syntax
			-- return string.format("![%s](%s)", path.name, path) -- this format is required for 3rd/image.nvim
		end,
	},
	completion = { nvim_cmp = false },
	picker = { name = "telescope.nvim" },
	-- what to do if :ObsidianOpenLink called on a non-file link (e.g. URL)
	follow_url_func = function(url)
		vim.fn.jobstart({ "xdg-open", url })
	end,
	ui = { enable = false },
})

require("render-markdown").setup({
	render_modes = { "n", "c", "t", "v", "V", "i", "x", "o", "\22" },
	latex = { enabled = false },
	file_types = { "markdown" },
	heading = {
		width = { "full", "block" },
		position = "inline",
		min_width = { 100, 70, 40, 30, 30, 30 },
		right_pad = 2,
	},
	code = {
		width = "block",
		right_pad = 2,
		min_width = 35,
	},
	bullet = { icons = { "" } },
	link = {
		wiki = { icon = " ", highlight = "RenderMarkdownWikiLink" },
	},
	sign = { enabled = false },
	anti_conceal = {
		ignore = {
			head_background = true,
		},
	},
	pipe_table = {
		enabled = true,
		preset = "none", -- remove rounded corners
		style = "full", -- include horizontal lines at top/bottom of table
		cell = "padded", -- use full visual width of cells, including concealed characters
	},
})
