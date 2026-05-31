local create_au = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("my autocommands", { clear = true })

-- Set cwd to file path or opened directory.
create_au("VimEnter", {
	desc = "set cwd to the directory of the first opened file",
	group = augroup,
	callback = function()
		local bufname = vim.api.nvim_buf_get_name(0)

		-- No change if opened an empty buffer.
		if bufname == "" then
			return
		end

		-- Depending which plugin is used as the default explorer.
		local is_dir = string.find(bufname, "NvimTree_1") or string.find(bufname, "oil://")

		if is_dir then
			bufname = string.gsub(bufname, "NvimTree_1", "").gsub(bufname, "oil://", "")
			vim.cmd(":cd " .. vim.fn.fnamemodify(bufname, ":p:h"))
    else
			vim.cmd(":cd %:h")
		end
	end,
})

-- Syntax highlighting for rc files.
create_au({ "BufNewFile", "BufRead" }, {
	desc = "Set syntax highlighting for bashrc files",
	group = augroup,
	pattern = { "*bashrc", "*zshrc" },
	command = "set filetype=sh",
})

-- Git commits.
create_au("FileType", {
	group = augroup,
	pattern = "gitcommit",
	callback = function()
		vim.opt_local.textwidth = 72
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
		vim.opt_local.formatoptions:append("t")
		vim.opt_local.colorcolumn = "73"
	end,
})
