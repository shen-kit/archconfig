-- keys

local map = vim.keymap.set
local opts = { silent = true, noremap = true }
local opts_loud = { silent = true, noremap = true }

-- bold / italic
map("i", "<C-b>", "**", opts)
map("v", "<C-b>", "s****<ESC>hP", opts) -- using mini.surround

-- checkboxes
map({ "i", "n" }, "<C-3>", "<CMD>ToggleCheckbox<CR>", opts)
map(
	"x",
	"<C-3>",
	':lua for i=vim.fn.line("\'<"),vim.fn.line("\'>") do vim.fn.cursor(i,1); vim.cmd("ToggleCheckbox") end<CR>gv',
	opts
)

-- ===== obsidian specific =====

map({ "i", "n" }, "<C-S-O>", "<CMD>ObsidianQuickSwitch<CR>", opts)
-- paste image with default name same as obsidian's naming
map({ "i", "n" }, "<M-v>", function()
	local fname = os.date("%Y%m%d%H%M%S") .. ".png"
	vim.cmd("ObsidianPasteImg" .. fname)
end, opts_loud)
