-- keys

local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-- bold / italic
map("i", "<C-b>", "**", opts)
map("v", "<C-b>", "s****<ESC>hP", opts) -- using mini.surround

-- obsidian
map({ "i", "n" }, "<C-S-O>", "<CMD>ObsidianQuickSwitch<CR>", opts)
-- paste image with default name
map("n", "<leader>op", function()
	local fname = os.date("%Y%m%d%H%M%S") .. ".png"
	vim.cmd("ObsidianPasteImg" .. fname)
end, { silent = false, noremap = true })
