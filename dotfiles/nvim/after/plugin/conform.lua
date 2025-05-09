require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		c = { "clang-format" },
		go = { "gofmt" },
	},
	format_on_save = {
		timeout_ms = 250,
		lsp_format = "fallback",
	},
})
