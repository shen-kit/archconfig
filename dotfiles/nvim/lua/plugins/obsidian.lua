return {
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    ft = 'markdown',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    event = {
      'BufReadPre ' .. vim.fn.expand('~') .. '/syncthing/1_notes/*.md',
      'BufNewFile ' .. vim.fn.expand('~') .. '/syncthing/1_notes/*.md',
    },
    config = function()
      require('obsidian').setup({
        workspaces = {
          { name = 'personal', path = '~/syncthing/1_notes/' },
        },
        frontmatter = { enabled = false },
        wiki_link_func = require('obsidian.builtin').wiki_link_id_prefix,
        link = { style = 'wiki' },
        new_notes_location = 'current_dir',
        picker = { name = 'telescope.nvim' },
        callbacks = {
          enter_note = function(note)
            local map = vim.keymap.set
            map({ 'i', 'n' }, '<C-S-O>', '<CMD>Obsidian quick_switch<CR>', { buffer = note.bufnr })
            map({ 'n' }, 'gf', '<CMD>Obsidian follow_link<CR>', { buffer = note.bufnr })
          end,
        },
        ui = { enable = false }, -- let render-markdown handle UI
        legacy_commands = false,
      })
    end,
  },
}
