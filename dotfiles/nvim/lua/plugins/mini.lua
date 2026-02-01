local map = vim.keymap.set

return {
	{
		"echasnovski/mini.ai",
		version = false,
		config = function()
			require("mini.ai").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "<leader>sa",
					delete = "<leader>sd",
					replace = "<leader>sr",
					-- disable
					find = "",
					find_left = "",
					highlight = "",
					update_n_lines = "",
				},
				-- surround each line in blockwise mode
				respect_selection_type = true,
			})
		end,
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		config = function()
			local bufremove = require("mini.bufremove")
			bufremove.setup()
			map("n", "<C-S-D>", bufremove.delete)
		end,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		-- keep cursor in place when commenting
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
	{
		"echasnovski/mini.cursorword",
		version = false,
		config = function()
			require("mini.cursorword").setup({ delay = 500 })
		end,
	},
}
