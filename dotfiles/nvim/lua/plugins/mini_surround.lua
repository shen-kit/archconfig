return {
  {
    'echasnovski/mini.surround',
    version = false,
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = '<leader>sa',
          delete = '<leader>sd',
          replace = '<leader>sr',
          -- disable
          find = '',
          find_left = '',
          highlight = '',
          update_n_lines = '',
        },
        -- surround each line in blockwise mode
        respect_selection_type = true,
      })
    end,
  },
}
