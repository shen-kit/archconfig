local g = vim.g
g.mapleader = " "
-- don't try to load python or perl packages, don't look for executable
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0

require("config.autocmds")
require("config.cmds")
require("config.opts")
require("config.keys")
require("config.lazy")
require("config.pluginKeys")
require("config.lsp")
