local create_cmd = vim.api.nvim_create_user_command

-- Format buffer.
create_cmd('Format', function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ['end'] = { args.line2, end_line:len() },
    }
  end
  require('conform').format({ async = true, lsp_format = 'fallback', range = range })
end, { range = true })

-- Sync plugins manually.
create_cmd('PluginSync', function()
  require('lazy').sync()
end, { desc = 'Sync plugins with lazy.nvim' })

-- Toggle autoformat.
create_cmd('ToggleAutoformat', function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  if vim.g.disable_autoformat then
    print('autoformat off')
  else
    print('autoformat on')
  end
end, { range = false })

-- Toggle diagnostic messages, underlines, signs.
create_cmd('ToggleDiagnostics', function()
  local to_set = not vim.diagnostic.config().underline
  local virtual_lines = to_set and { current_line = true } or false
  vim.diagnostic.config({
    virtual_lines = virtual_lines,
    underline = to_set,
    signs = to_set,
  })
end, { range = false })
