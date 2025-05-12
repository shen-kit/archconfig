local g = vim.g
g.mapleader = " "
-- don't try to load python or perl packages, don't look for executable
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
-- bullets.nvim config
g.bullets_outline_levels = { "num", "std-" } -- if indenting after a number, use unordered list
g.bullets_nested_checkboxes = 0 -- don't toggle parents to 'partial' state when child checked
g.bullets_set_mappings = 0 -- disable default mappings
g.bullets_custom_mappings = {
	-- list continuation
	{ "imap", "<CR>", "<Plug>(bullets-newline)" },
	{ "nmap", "o", "<Plug>(bullets-newline)" },
	-- indenting
	{ "imap", "<C-t>", "<Plug>(bullets-demote)" },
	{ "imap", "<C-d>", "<Plug>(bullets-promote)" },
	{ "nmap", ">", "<Plug>(bullets-demote)" },
	{ "vmap", ">", "<Plug>(bullets-demote)gv" },
	{ "nmap", "<", "<Plug>(bullets-promote)" },
	{ "vmap", "<", "<Plug>(bullets-promote)gv" },
	-- renumbering lists
	{ "imap", "<C-2>", "<Plug>(bullets-renumber)" },
	{ "nmap", "<C-2>", "<Plug>(bullets-renumber)" },
	{ "vmap", "<C-2>", "<Plug>(bullets-renumber)gv" },
}

require("config.autocmds")
require("config.cmds")
require("config.opts")
require("config.keys")
require("config.lazy")
require("config.pluginKeys")
require("config.lsp")
