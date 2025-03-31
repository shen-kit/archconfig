return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		event = { -- only load for markdown files in my vault
			"BufReadPre /home/shenkit/gDrive/1_obsidian/**",
			"BufNewFile /home/shenkit/gDrive/1_obsidian/**",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{ "dhruvasagar/vim-table-mode" },
	{ "bullets-vim/bullets.vim" },
}
