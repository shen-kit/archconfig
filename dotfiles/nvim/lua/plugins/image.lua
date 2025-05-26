local obsidian_root_path = "/home/shenkit/gDrive/1_obsidian"

return {
	{
		"3rd/image.nvim",
		build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
		config = function()
			require("image").setup({
				processor = "magick_cli",
				integrations = {
					markdown = {
						only_render_image_at_cursor = true,
						max_width_window_percentage = 80,
						max_height_window_percentage = 80,
						-- images in obsidian vault in absolute path
						resolve_image_path = function(document_path, image_path, fallback)
							local working_dir = vim.fn.getcwd()

							-- default behaviour if not in obsidian vault
							if not working_dir:find(obsidian_root_path) then
								return fallback(document_path, image_path)
							end

							-- ignore size
							if image_path:find("|") then
								image_path = vim.split(image_path, "|")[1]
							end
							local assets_dir = "obsidian_attachments"
							local result = string.format("%s/%s/%s", obsidian_root_path, assets_dir, image_path)
							return result
						end,
					},
					neorg = { enabled = false },
					typst = { enabled = false },
					html = { enabled = false },
					css = { enabled = false },
				},
			})
		end,
	},

	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {
			dir_path = obsidian_root_path .. "/obsidian_attachments",
			file_name = "Pasted Image %Y%m%d%H%M%S",
			use_absolute_path = true,
			prompt_for_file_name = false,
			filetypes = {
				markdown = {
					template = "![[$FILE_NAME]]",
				},
			},
			keys = {
				{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
			},
		},
	},
}
