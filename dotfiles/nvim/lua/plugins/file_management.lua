return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function ()
      return {
        defaults = {
          mappings = {
            n = {
              ["d"] = require("telescope.actions").delete_buffer,
              ["q"] = require("telescope.actions").close,
            }
          }
        }
      }
    end
  },

  { 'ThePrimeagen/harpoon' },
}

