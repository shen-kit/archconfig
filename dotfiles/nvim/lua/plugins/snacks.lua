local obsidian_root_path = '/home/shenkit/syncthing/1_notes/'
local obsidian_assets_dir = 'obsidian_attachments'

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      image = {
        enabled = true,
        doc = {
          enabled = true,
          inline = true,
          float = true,
          conceal = function(_, type)
            return type == "math"
          end,
        },
        math = {
          enabled = true,
          latex = {
            font_size = 'normalsize',
          },
        },
        -- resolve images in obsidian vault
        resolve = function(document_path, image_path)
          if not document_path:find(obsidian_root_path, 1, true) then
            return nil
          end

          if image_path:find('|') then
            image_path = vim.split(image_path, '|')[1]
          end
          return string.format('%s/%s/%s', obsidian_root_path, obsidian_assets_dir, image_path)
        end,
      },
    },
    keys = {
      {"<leader>sh", function() require("snacks").image.hover() end}
    }
  },
}
