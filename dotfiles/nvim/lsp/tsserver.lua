return {
  cmd = { 'typescript-language-server', '--stdio' },
  root_markers = { 'package.json', 'package-lock.json', 'node_modules', '.git', 'index.js' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
}
