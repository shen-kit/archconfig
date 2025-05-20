return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			-- lsp folding
			-- local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- capabilities.textDocument.foldingRange = {
			-- 	dynamicRegistration = false,
			-- 	lineFoldingOnly = true,
			-- }
			--
			-- local language_servers = vim.lsp.get_clients()
			-- for _, ls in ipairs(language_servers) do
			-- 	require("lspconfig")[ls].setup({ capabilities = capabilities })
			-- end

			-- setup ufo
			require("ufo").setup({
				provider_selector = function()
					return { "treesitter", "indent" } -- "lsp"
				end,
				open_fold_hl_timeout = 0,
				fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
					local newVirtText = {}
					local suffix = (" ... (%d lines)"):format(endLnum - lnum)
					local sufWidth = vim.fn.strdisplaywidth(suffix)
					local targetWidth = width - sufWidth
					local curWidth = 0
					for _, chunk in ipairs(virtText) do
						local chunkText = chunk[1]
						local chunkWidth = vim.fn.strdisplaywidth(chunkText)
						if targetWidth > curWidth + chunkWidth then
							table.insert(newVirtText, chunk)
						else
							chunkText = truncate(chunkText, targetWidth - curWidth)
							local hlGroup = chunk[2]
							table.insert(newVirtText, { chunkText, hlGroup })
							chunkWidth = vim.fn.strdisplaywidth(chunkText)
							-- str width returned from truncate() may less than 2nd argument, need padding
							if curWidth + chunkWidth < targetWidth then
								suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
							end
							break
						end
						curWidth = curWidth + chunkWidth
					end
					table.insert(newVirtText, { suffix, "MoreMsg" })
					return newVirtText
				end,
			})

			-- keymaps
			local foldLevel = 99

			vim.keymap.set("n", "zR", function()
				foldLevel = 99
				require("ufo").closeFoldsWith(foldLevel)
			end)
			vim.keymap.set("n", "zM", function()
				foldLevel = 0
				require("ufo").closeFoldsWith(foldLevel)
			end)
			vim.keymap.set("n", "zr", function()
				foldLevel = foldLevel + 1
				require("ufo").closeFoldsWith(foldLevel)
			end)
			vim.keymap.set("n", "zm", function()
				foldLevel = foldLevel - 1
				require("ufo").closeFoldsWith(foldLevel)
			end)
			vim.keymap.set("n", "zk", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end)
		end,
	},
}
