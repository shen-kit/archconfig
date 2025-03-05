local create_au = vim.api.nvim_create_autocmd
local my_group = vim.api.nvim_create_augroup('my autocommands', { clear = true })

-- lsp keymaps
create_au('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')                -- Displays hover information about the symbol under the cursor
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')          -- Jump to the definition
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')         -- Jump to declaration
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')      -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')     -- Jumps to the definition of the type symbol
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')          -- List all references
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')      -- Displays a function's signature information
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')            -- Renames all references to the symbol under the cursor
    bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>') -- Selects a code action available at the current cursor position
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')       -- Show diagnostics in a floating window
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')        -- Move to the previous diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')        -- Move to the next diagnostic
  end,
  group = my_group,
})

-- set cwd to file path or open directory
create_au('VimEnter', {
  desc = 'set cwd to the directory of the first opened file',
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    -- no change if opened an empty buffer
    if bufname == "" then return end
    -- depending which plugin is used as the default explorer
    local is_dir = string.find(bufname, "NvimTree_1") or string.find(bufname, "oil://")

    if is_dir then
      bufname = string.gsub(bufname, "NvimTree_1", "").gsub(bufname, "oil://", "")
      vim.cmd(":cd " .. vim.fn.fnamemodify(bufname, ":p:h"))
    elseif not is_nvim_tree then
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

-- syntax highlighting
create_au({ "BufNewFile", "BufRead" }, {
  desc = "Set syntax highlighting for bashrc files",
  pattern = "*bashrc",
  command = "set filetype=sh",
  group = my_group,
})

-- -- set scroll amount
-- create_au({ "BufReadPost" }, {
--   desc = "Reduce <C-D> and <C-U> to scroll 15 lines",
--   command = "set scroll=15",
--   group = my_group
-- })
