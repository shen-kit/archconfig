local create_cmd = vim.api.nvim_create_user_command

-- format buffer
create_cmd("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

-- toggle diagnostic messages, underlines, signs
create_cmd("ToggleDiagnostics", function()
	local toSet = not vim.diagnostic.config().underline
	local virtualLines = toSet and { current_line = true } or false
	vim.diagnostic.config({
		virtual_lines = virtualLines,
		underline = toSet,
		signs = toSet,
	})
end, { range = false })
