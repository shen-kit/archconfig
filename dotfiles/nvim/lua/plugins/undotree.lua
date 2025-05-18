return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", "<CMD>UndotreeToggle<CR><CMD>UndotreeFocus<CR>")
	end,
}
