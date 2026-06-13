return {
  {
    'pablopunk/pi.nvim',
    config = function()
      require('pi').setup({
        binary = '~/.local/share/npm/bin/pi',
        thinking = 'off',
      })

      vim.keymap.set('n', '<leader>ai', ':PiAsk<CR>')
      vim.keymap.set('v', '<leader>ai', ':PiAskSelection<CR>')
    end,
  },
}
