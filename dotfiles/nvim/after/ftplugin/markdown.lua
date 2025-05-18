-- ===== keys =====

local map = vim.keymap.set

-- bold / italic
map("i", "<C-b>", "**")
map("v", "<C-b>", "s****<ESC>hP") -- using mini.surround
