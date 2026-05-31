return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		ft = "markdown",
		config = function()
			require("render-markdown").setup({
				file_types = { "markdown" },
				render_modes = true, -- always render
				latex = { enabled = false },
				sign = { enabled = false },
				paragraph = { enabled = false },
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
}
