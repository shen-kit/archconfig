local obsidian_root_path = '/home/shenkit/syncthing/1_notes/'
local obsidian_assets_dir = 'obsidian_attachments'

return {
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
