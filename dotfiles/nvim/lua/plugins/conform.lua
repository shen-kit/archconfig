return {
	"stevearc/conform.nvim",
	config = function()
    vim.g.disable_autoformat = true
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				c = { "clang-format" },
				go = { "gofmt" },
			},
			default_format_opts = {
				lsp_format = "fallback",
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
