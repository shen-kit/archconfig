local function map_markdown_keymaps(bufnr)
	local map = vim.keymap.set
	local opts = { buffer = bufnr }

	-- keep <C-i> functionality
	map("n", "<C-i>", "<C-i>")

	-- continuation
	map("i", "<CR>", "<CMD>InsertNewBullet<CR>", opts)
	map("n", "o", "<CMD>InsertNewBullet<CR>", opts)

	-- indenting
	map("i", "<C-t>", "<CMD>BulletDemote<CR>", opts)
	map("i", "<C-d>", "<CMD>BulletPromote<CR>", opts)
	map("n", ">", "<CMD>BulletDemote<CR>", opts)
	map("n", "<", "<CMD>BulletPromote<CR>", opts)
	map({ "i", "n" }, "<Tab>", "<CMD>BulletDemote<CR>", opts)
	map({ "i", "n" }, "<S-Tab>", "<CMD>BulletPromote<CR>", opts)
	map("x", ">", "<CMD>BulletDemoteVisual<CR>gv", opts)
	map("x", "<", "<CMD>BulletPromoteVisual<CR>gv", opts)
	map("x", "<Tab>", "<CMD>BulletDemoteVisual<CR>gv", opts)
	map("x", "<S-Tab>", "<CMD>BulletPromoteVisual<CR>gv", opts)

	-- ordered lists
	map({ "i", "n" }, "<C-2>", "<CMD>RenumberList<CR>", opts)
	map("v", "<C-2>", "<CMD>RenumberSelection<CR>gv", opts)

	-- checkboxes
	map({ "i", "n" }, "<C-3>", "<CMD>ToggleCheckbox<CR>", opts)
	map(
		"x",
		"<C-3>",
		':lua for i=vim.fn.line("\'<"),vim.fn.line("\'>") do vim.fn.cursor(i,1); vim.cmd("ToggleCheckbox") end<CR>gv',
		opts
	)
end

local function setup_markdown_keymaps()
	if vim.bo.filetype == "markdown" then
		map_markdown_keymaps(0)
	end

	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("bullets_markdown_keymaps", { clear = true }),
		pattern = "markdown",
		callback = function(args)
			map_markdown_keymaps(args.buf)
		end,
	})
end

return {
	{
		"bullets-vim/bullets.vim",
		ft = "markdown",
		init = function()
			local g = vim.g
			g.bullets_outline_levels = { "num", "std-" } -- if indenting after a number, use unordered list
			g.bullets_nested_checkboxes = 0 -- don't toggle parents to 'partial' state when child checked
			g.bullets_set_mappings = 0 -- disable default mappings
		end,
		config = setup_markdown_keymaps,
	}, -- auto-insert new bullet on <CR>
}
