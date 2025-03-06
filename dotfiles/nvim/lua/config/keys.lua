local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local nosilent = { noremap = true, silent = false }

map('i', 'jk', '<ESC>', opts)

-- set working directory to the current buffer's directory
map('n', '<leader>cd', '<CMD>cd %:h<CR>', { noremap = true, silent = false })

-- ============================================================
--                            Editing
-- ============================================================

-- map ctrl+enter to new line below
map('i', '<C-S-CR>', '<C-o>O', opts)
map('i', '<C-CR>', '<C-o>o', opts)
map('n', '<C-S-CR>', 'O<ESC>', opts)
map('n', '<C-CR>', 'o<ESC>', opts)

-- move lines up/down
map('x', '<M-C-j>', ":m '>+1<CR>gv=gv", opts)
map('x', '<M-C-k>', ":m '<-2<CR>gv=gv", opts)
map('n', '<M-C-k>', ":m -2<CR>", opts)
map('n', '<M-C-j>', ":m +1<CR>", opts)
map('i', '<M-C-k>', "<ESC>:m -2<CR>a", opts)
map('i', '<M-C-j>', "<ESC>:m +1<CR>a", opts)

-- indents
map('x', '<', '<gv', opts)
map('x', '>', '>gv', opts)
map('n', '<', '<<', opts)
map('n', '>', '>>', opts)
map('i', '<S-Tab>', '<C-D>', opts)

-- search and replace the word under the cursor
map('n', '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], nosilent)

-- in-place cursor
map('i', '<C-/>', "<ESC>my:norm gcc<CR>`ya", { remap = true })
map('n', '<C-/>', 'mygcc `y', { remap = true })
map('n', 'J', 'mzJ`z', opts)

-- reduce scroll amount
map('n', '<C-u>', '15<C-u>', opts)
map('n', '<C-d>', '15<C-d>', opts)

-- ============================================================
--                    Working With Files
-- ============================================================

-- save / exit
map({ 'i', 'n', 'x' }, '<C-s>', '<CMD>w<CR>', nosilent)
map('n', '<C-S-Q>', '<CMD>wqa<CR>', opts)

-- alternate buffer
map('n', '<leader><leader>', '<C-^>', opts)

-- yank keeping cursor in-place
map('x', 'y', "ygv<ESC>", opts)
map('x', 'Y', '"+ygv<ESC>', opts) -- to system clipboard

-- ctrl+scroll to scroll 3 lines at a time (default 1)
-- shift+scroll maps to <C-d> / <C-u>
map({ 'n', 'v' }, '<C-ScrollWheelDown>', '3<C-e>', opts)
map({ 'n', 'v' }, '<C-ScrollWheelUp>', '3<C-y>', opts)
map({ 'n', 'v' }, '<S-ScrollWheelDown>', '<C-d>', opts)
map({ 'n', 'v' }, '<S-ScrollWheelUp>', '<C-u>', opts)
map('i', '<C-ScrollWheelDown>', '<C-x><C-e><C-e><C-e>', opts)
map('i', '<C-ScrollWheelUp>', '<C-x><C-y><C-y><C-y>', opts)
map('i', '<S-ScrollWheelDown>', '<C-x><C-d>', opts)
map('i', '<S-ScrollWheelUp>', '<C-x><C-u>', opts)

-- ============================================================
--                          Plugins
-- ============================================================

-- mini.files
map({ 'i', 'n' }, '<C-S-L>', '<CMD>lua MiniFiles.open()<CR>', opts)

-- mini.bufremove
map('n', '<C-S-D>', '<CMD>lua MiniBufremove.delete()<CR>', opts)

-- nvim tree
map({ 'i', 'n' }, '<C-S-P>', vim.cmd.NvimTreeToggle, opts)
map('n', '<leader>fc', vim.cmd.NvimTreeFindFile, opts)

-- telescope
local telescope = require('telescope.builtin')
map('n', '<leader>ff', telescope.git_files, opts)
map('n', '<leader>fa', telescope.find_files, opts)
map('n', '<leader>b', telescope.buffers, opts)
map('n', '<leader>fg', function()
  telescope.grep_string({ search = vim.fn.input("Grep > ") })
end, opts)

-- no neck pain (centre buffer)
map('n', '<leader>cc', '<CMD>NoNeckPain<CR>', opts)

-- harpoon
map('n', '<leader>h', function() require('harpoon.ui').nav_file(1) end, opts)
map('n', '<leader>j', function() require('harpoon.ui').nav_file(2) end, opts)
map('n', '<leader>k', function() require('harpoon.ui').nav_file(3) end, opts)
map('n', '<leader>l', function() require('harpoon.ui').nav_file(4) end, opts)
map('n', '<leader>;', function() require('harpoon.ui').nav_file(5) end, opts)
map('n', '<leader>\'', function() require('harpoon.ui').nav_file(6) end, opts)
map('n', '<leader>e', function() require('harpoon.ui').toggle_quick_menu() end, opts)
map('n', '<leader>a', function() require("harpoon.mark").add_file() end, opts)

-- undotree
map('n', '<leader>u', vim.cmd.UndotreeToggle, opts)

-- smart splits
-- moving between splits
map('n', '<M-h>', require('smart-splits').move_cursor_left, opts)
map('n', '<M-j>', require('smart-splits').move_cursor_down, opts)
map('n', '<M-k>', require('smart-splits').move_cursor_up, opts)
map('n', '<M-l>', require('smart-splits').move_cursor_right, opts)
map('n', '<M-\\>', require('smart-splits').move_cursor_previous, opts)
-- resizing splits
map('n', '<M-H>', require('smart-splits').resize_left, opts)
map('n', '<M-J>', require('smart-splits').resize_down, opts)
map('n', '<M-K>', require('smart-splits').resize_up, opts)
map('n', '<M-L>', require('smart-splits').resize_right, opts)
-- swapping buffers between windows
map('n', '<M-C-S-H>', require('smart-splits').swap_buf_left, opts)
map('n', '<M-C-S-J>', require('smart-splits').swap_buf_down, opts)
map('n', '<M-C-S-K>', require('smart-splits').swap_buf_up, opts)
map('n', '<M-C-S-L>', require('smart-splits').swap_buf_right, opts)

-- ufo (folds)
map('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
map('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
map('n', 'zk', function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = 'Peek fold' })
