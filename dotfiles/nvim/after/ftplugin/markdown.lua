local map = vim.keymap.set
local opts = { buffer = true }

-- bold / italic
map('i', '<C-b>', '**', opts)
map('v', '<C-b>', 's****<ESC>hP', opts) -- using mini.surround

-- ===== OPTIONS =====
vim.wo.conceallevel = 2
