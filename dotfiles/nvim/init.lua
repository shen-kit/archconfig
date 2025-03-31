local g = vim.g
g.mapleader = " "

require("config.autocmds")
require("config.cmds")
require("config.opts")
require("config.keys")
require("config.lazy")
require("config.pluginKeys")

-- lsp / diagnostics
vim.lsp.enable({ "clangd", "jdtls", "lua_ls", "ts_ls", "pyright", "gopls" })
vim.diagnostic.config({ virtual_lines = { current_line = true } })
