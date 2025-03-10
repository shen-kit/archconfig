-- ==========  OPTIONS ==========

local opt = vim.opt

opt.breakindentopt = "list:2" -- wrap to same indentation as bullet lists

opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = false

-- ==========  KEYBINDS ==========

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- bold text
map("x", "<C-b>", "c****<ESC>hPgvllollo", opts)
map("n", "<C-b>", "viwc****<ESC>hP", opts)
map("i", "<C-b>", "**", opts)

-- checkboxes
map({ "n", "i" }, "<C-3>", "<CMD>ToggleCheckbox<CR>", opts)
map("x", "<C-3>", ":norm @c<CR>gv", opts) -- requires @c to be bound to :ObsidianToggleCheckbox

-- obsidian
map("n", "<C-S-O>", vim.cmd.ObsidianQuickSwitch, opts) -- quick switcher (Ctrl+Shift+O)
map("n", "<leader>op", vim.cmd.ObsidianOpen, opts) -- open in app

-- ==========  COMPLETION ==========
-- remove completion engines except snippets
require("cmp").setup.buffer({
	sources = { { name = "luasnip" } },
})
