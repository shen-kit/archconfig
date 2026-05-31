local g = vim.g

g.mapleader = " "

-- Don't try to load Python or Perl providers.
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0

-- Make all keymaps silent by default.
local keymap_set = vim.keymap.set
---@diagnostic disable-next-line: duplicate-set-field
vim.keymap.set = function(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false
	return keymap_set(mode, lhs, rhs, opts)
end
