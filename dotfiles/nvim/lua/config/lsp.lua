vim.lsp.enable({
	"clangd",
	"lua_ls",
	"pyright",
	"tsserver",
	"gopls",
})

vim.diagnostic.config({ virtual_lines = { current_line = true } })
