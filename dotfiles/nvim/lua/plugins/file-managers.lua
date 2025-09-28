local map = vim.keymap.set
return {

	-- very promising, mixture of oil+tree view
	-- {
	-- 	"A7Lavinraj/fyler.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	opts = {
	-- 		icon_provider = "nvim-web-devicons",
	-- 		views = {
	-- 			explorer = {
	-- 				kind = "split:leftmost",
	-- 				width = 0.2,
	-- 				height = 1.0,
	-- 			},
	-- 		},
	-- 	},
	-- },

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("nvim-tree").setup({
				view = { width = 40 },
				filters = { dotfiles = false },
				actions = { open_file = { quit_on_open = true } },
				hijack_directories = { enable = true },
			})

			map({ "i", "n" }, "<C-S-P>", vim.cmd.NvimTreeToggle)
			map("n", "<leader>fc", vim.cmd.NvimTreeFindFile)
		end,
	},

	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup()

			local harpoon_ui = require("harpoon.ui")
			map("n", "<leader>h", function()
				harpoon_ui.nav_file(1)
			end)
			map("n", "<leader>j", function()
				harpoon_ui.nav_file(2)
			end)
			map("n", "<leader>k", function()
				harpoon_ui.nav_file(3)
			end)
			map("n", "<leader>l", function()
				harpoon_ui.nav_file(4)
			end)
			map("n", "<leader>;", function()
				harpoon_ui.nav_file(5)
			end)
			map("n", "<leader>'", function()
				harpoon_ui.nav_file(6)
			end)
			map("n", "<leader>e", function()
				harpoon_ui.toggle_quick_menu()
			end)
			map("n", "<leader>a", function()
				require("harpoon.mark").add_file()
			end)
		end,
	},
}
