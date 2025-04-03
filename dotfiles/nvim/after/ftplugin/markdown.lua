-- keys

local map = vim.keymap.set
local opts = { silent = true, noremap = true }
local opts_loud = { silent = true, noremap = true }

-- bold / italic
map("i", "<C-b>", "**", opts)
map("v", "<C-b>", "s****<ESC>hP", opts) -- using mini.surround

-- ===== obsidian specific =====

map({ "i", "n" }, "<C-S-O>", "<CMD>ObsidianQuickSwitch<CR>", opts)
-- paste image with default name same as obsidian's naming
map({ "i", "n" }, "<M-v>", function()
	local fname = os.date("%Y%m%d%H%M%S") .. ".png"
	vim.cmd("ObsidianPasteImg" .. fname)
end, opts_loud)
