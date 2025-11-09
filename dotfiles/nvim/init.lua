local g = vim.g
g.mapleader = " "

-- don't try to load python or perl packages, don't look for executable
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0

-- make all keymaps silent by default
local keymap_set = vim.keymap.set
---@diagnostic disable-next-line: duplicate-set-field
vim.keymap.set = function(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false
	return keymap_set(mode, lhs, rhs, opts)
end

require("config.autocmds")
require("config.cmds")
require("config.opts")
require("config.keys")
require("config.lazy")
require("config.lsp")

-- defaults
vim.g.disable_autoformat = true
