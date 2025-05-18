local map = vim.keymap.set
return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/gDrive/1_obsidian/*.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/gDrive/1_obsidian/*.md",
		},
		config = function()
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

			-- keymaps
			map({ "i", "n" }, "<C-S-O>", "<CMD>ObsidianQuickSwitch<CR>")
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		config = function()
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
		end,
	},
	{
		"Kicamon/markdown-table-mode.nvim",
		config = function()
			require("markdown-table-mode").setup()
			map("n", "<leader>tm", "<CMD>Mtm<CR>")
		end,
	},
	{
		"bullets-vim/bullets.vim",
		config = function()
			local g = vim.g
			g.bullets_outline_levels = { "num", "std-" } -- if indenting after a number, use unordered list
			g.bullets_nested_checkboxes = 0 -- don't toggle parents to 'partial' state when child checked
			g.bullets_set_mappings = 0 -- disable default mappings

			-- continuation
			map("i", "<CR>", "<CMD>InsertNewBullet<CR>")
			map("n", "o", "<CMD>InsertNewBullet<CR>")

			-- indenting
			map("i", "<C-t>", "<CMD>BulletDemote<CR>")
			map("i", "<C-d>", "<CMD>BulletPromote<CR>")
			map("n", ">", "<CMD>BulletDemote<CR>")
			map("n", "<", "<CMD>BulletPromote<CR>")
			map("x", ">", "<CMD>BulletDemoteVisual<CR>gv")
			map("x", "<", "<CMD>BulletPromoteVisual<CR>gv")

			-- ordered lists
			map({ "i", "n" }, "<C-2>", "<CMD>RenumberList<CR>")
			map("v", "<C-2>", "<CMD>RenumberSelection<CR>gv")

			-- checkboxes
			map({ "i", "n" }, "<C-3>", "<CMD>ToggleCheckbox<CR>")

			map(
				"x",
				"<C-3>",
				':lua for i=vim.fn.line("\'<"),vim.fn.line("\'>") do vim.fn.cursor(i,1); vim.cmd("ToggleCheckbox") end<CR>gv'
			)
		end,
	}, -- auto-insert new bullet on <CR>
}
