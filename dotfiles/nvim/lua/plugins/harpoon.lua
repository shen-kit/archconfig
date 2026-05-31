return {
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup()

			local map = vim.keymap.set
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
