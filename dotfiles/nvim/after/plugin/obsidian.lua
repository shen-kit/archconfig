require("obsidian").setup({
	workspaces = {
		{ name = "personal", path = "~/gDrive/1_obsidian/" },
	},
	completion = { blink = true, nvim_cmp = false },
	disable_frontmatter = true,
	wiki_link_func = "use_alias_only",
	new_notes_location = "current_dir",
	picker = { name = "telescope.nvim" },
	-- what to do if :ObsidianOpenLink called on a non-file link (e.g. URL)
	follow_url_func = function(url)
		vim.fn.jobstart({ "xdg-open", url })
	end,
	mappings = {
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
	},
	ui = { enable = false },
})

require("render-markdown").setup({
	render_modes = true, -- always render
	latex = { enabled = true },
	file_types = { "markdown" },
	-- checkboxes and callouts
	completions = { blink = { enabled = true } },
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
