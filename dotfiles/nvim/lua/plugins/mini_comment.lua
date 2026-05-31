return {
	{
		"echasnovski/mini.comment",
		version = false,
		config = function()
			require("mini.comment").setup()

			local function comment_normal()
				local pos = vim.api.nvim_win_get_cursor(0)
				vim.cmd("normal gcc")
				vim.schedule(function()
					vim.api.nvim_win_set_cursor(0, pos)
				end)
			end

			local function comment_visual()
				local curpos = vim.api.nvim_win_get_cursor(0)
				vim.cmd("normal gc")
				vim.schedule(function()
					vim.api.nvim_win_set_cursor(0, curpos)
				end)
			end

			local map = vim.keymap.set
			map("n", "<C-_>", comment_normal)
			map("v", "<C-_>", comment_visual)
			map("i", "<C-_>", function()
				vim.cmd("stopinsert")
				vim.cmd("normal l")
				vim.schedule(function()
					comment_normal()
					vim.cmd("startinsert")
				end)
			end)
		end,
	},
}
