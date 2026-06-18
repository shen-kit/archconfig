local obsidian_root_path = '/home/shenkit/syncthing/1_notes/'
local obsidian_assets_dir = 'obsidian_attachments'

return {
  {
    '3rd/image.nvim',
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    config = function()
      require('image').setup({
        processor = 'magick_cli',
        integrations = {
          markdown = {
            only_render_image_at_cursor = true,
            max_width_window_percentage = 80,
            max_height_window_percentage = 80,
            -- images in obsidian vault in absolute path
            resolve_image_path = function(document_path, image_path, fallback)
              -- default behaviour if not in obsidian vault
              if not document_path:find(obsidian_root_path, 1, true) then
                return fallback(document_path, image_path)
              end

              -- ignore size
              if image_path:find('|') then
                image_path = vim.split(image_path, '|')[1]
              end
              local result = string.format('%s/%s/%s', obsidian_root_path, obsidian_assets_dir, image_path)
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
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>p', '<cmd>PasteImage<cr>', desc = 'Paste image from system clipboard', ft = 'markdown' },
    },
    opts = {
      dir_path = string.format('%s/%s', obsidian_root_path, obsidian_assets_dir),
      file_name = 'Pasted Image %Y%m%d%H%M%S',
      use_absolute_path = true,
      prompt_for_file_name = false,
      filetypes = {
        markdown = {
          template = '![[$FILE_NAME]]',
        },
      },
    },
  },
}
