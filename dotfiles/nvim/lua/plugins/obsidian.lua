return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/gDrive/1_obsidian/*.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/gDrive/1_obsidian/*.md",
		},
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{ "dhruvasagar/vim-table-mode" },
	-- { "bullets-vim/bullets.vim" },
}
