vim.lsp.enable({
  'bashls',
  'clangd',
  'lua_ls',
  'basedpyright',
  'ruff',
  'tsserver',
  'gopls',
  'dockerls',
  'jdtls',
})

vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
    severity = { min = vim.diagnostic.severity.WARN },
  },
})
