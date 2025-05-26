return {
	"stevearc/conform.nvim",
	config = function()
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
				java = { "jdtls" },
			},
			format_on_save = function()
				if vim.g.disable_autoformat then
					return
				end
				return { timeout_ms = 250, lsp_format = "fallback" }
			end,
		})
	end,
}
