return {
  {
    'echasnovski/mini.bufremove',
    version = false,
    config = function()
      local bufremove = require('mini.bufremove')
      bufremove.setup()
      vim.keymap.set('n', '<C-S-D>', bufremove.delete)
    end,
  },
}
