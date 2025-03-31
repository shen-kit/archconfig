local create_au = vim.api.nvim_create_autocmd
local my_group = vim.api.nvim_create_augroup("my autocommands", { clear = true })

-- set cwd to file path or open directory
create_au("VimEnter", {
	desc = "set cwd to the directory of the first opened file",
	callback = function()
		local bufname = vim.api.nvim_buf_get_name(0)
		-- no change if opened an empty buffer
		if bufname == "" then
			return
		end
		-- depending which plugin is used as the default explorer
		local is_dir = string.find(bufname, "NvimTree_1") or string.find(bufname, "oil://")

		if is_dir then
			bufname = string.gsub(bufname, "NvimTree_1", "").gsub(bufname, "oil://", "")
			vim.cmd(":cd " .. vim.fn.fnamemodify(bufname, ":p:h"))
		elseif not ic_nvim_tree then
			vim.cmd(":cd %:h")
		end
	end,
	group = my_group,
})

-- update plugins on start
create_au("User", {
	pattern = "LazyVimStarted",
	desc = "update plugins",
	command = "lua require('lazy').sync({ show = false })",
})

-- syntax highlighting for rc files
create_au({ "BufNewFile", "BufRead" }, {
	desc = "Set syntax highlighting for bashrc files",
	pattern = { "*bashrc", "*zshrc" },
	command = "set filetype=sh",
	group = my_group,
})
