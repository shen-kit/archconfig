vim.lsp.enable({
	"clangd",
	"lua_ls",
	-- "pyright",
	"basedpyright",
	"tsserver",
	"gopls",
	"dockerls",
})

vim.diagnostic.config({ virtual_lines = { current_line = true } })
