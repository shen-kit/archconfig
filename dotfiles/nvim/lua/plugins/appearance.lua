return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function() vim.cmd("colorscheme catppuccin") end
	},

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    options = { theme = "catppuccin" },
  },

  { "nvim-treesitter/nvim-treesitter" },
  
  -- highlight the word under the cursor
  {
    'echasnovski/mini.cursorword',
    version = '*'
  },

  -- centre buffer
  { "shortcuts/no-neck-pain.nvim" },
}

