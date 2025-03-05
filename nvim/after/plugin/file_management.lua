require('harpoon').setup()

require("nvim-tree").setup({
  view = { width = 40 },
  filters = { dotfiles = true },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  hijack_directories = {
    enable = true,
  },
})

