local lspconfig = require('lspconfig')

-- configure lsp servers
lspconfig.ts_ls.setup({})                                               -- typescript
lspconfig.pyright.setup({})                                             -- python
lspconfig.jdtls.setup({})                                               -- java
lspconfig.clangd.setup({})                                              -- C / C++
lspconfig.gopls.setup({})                                               -- golang
lspconfig.hls.setup({ filetypes = { 'haskell', 'lhaskell', 'cabal' } }) -- haskell
lspconfig.lua_ls.setup({                                                -- lua
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      return
    end
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = { version = 'LuaJIT' }, -- lua version being used (LuaJIT for Neovim)
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    })
  end,
  settings = { Lua = {} },
})
