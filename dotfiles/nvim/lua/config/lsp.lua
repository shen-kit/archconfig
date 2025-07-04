vim.lsp.enable({
	"clangd",
	"lua_ls",
	"basedpyright",
	"ruff",
	"tsserver",
	"gopls",
	"dockerls",
})

vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
		severity = { min = vim.diagnostic.severity.WARN },
	},
})
