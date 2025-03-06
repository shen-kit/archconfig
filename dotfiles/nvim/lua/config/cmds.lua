-- toggle diagnostic messages
vim.api.nvim_create_user_command("DiagnosticToggle", function()
  local config = vim.diagnostic.config
  local toSet = not config().virtual_text
  config { virtual_text = toSet }
end, { desc = "toggle diagnostics virtual text" })

-- format buffer
vim.api.nvim_create_user_command("Format", function(args)
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

-- enable/disable autocomplete
vim.api.nvim_create_user_command("AutocompleteDisable", function()
  require('cmp').setup({ enabled = false })
end, { desc = "toggle nvim-cmp" })
vim.api.nvim_create_user_command("AutocompleteEnable", function()
  require('cmp').setup({ enabled = true })
end, { desc = "toggle nvim-cmp" })
