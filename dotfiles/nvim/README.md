# Neovim configuration

This config is organized so each concern lives in one predictable place. Plugin setup, plugin-specific keymaps, and plugin-specific globals stay together, so removing a plugin usually means deleting one file.

## Structure

```text
init.lua                         Entry point and load order
lua/config/bootstrap.lua         Leader, providers, silent keymap default
lua/config/options.lua           Core Neovim options
lua/config/keymaps.lua           Core keymaps only
lua/config/autocommands.lua      Core autocommands
lua/config/commands.lua          User commands
lua/config/lazy.lua              lazy.nvim bootstrap and setup
lua/config/lsp.lua               Enabled LSP servers and diagnostics
lua/config/telescope/            Telescope helper modules
lua/plugins/*.lua                Plugin specs, config, and plugin keymaps
lsp/*.lua                        Native Neovim LSP server configs
after/ftplugin/*.lua             Filetype-local config and keymaps
snippets/                        Custom snippets
codestyles/                      Formatter style files
```

## Adding a plugin

1. Create `lua/plugins/<plugin_name>.lua`.
2. Return a lazy.nvim spec from that file.
3. Put plugin options, setup code, keymaps, and plugin-specific globals in the same file.

Example:

```lua
return {
  {
    "author/plugin.nvim",
    opts = {
      -- plugin options
    },
    config = function(_, opts)
      require("plugin").setup(opts)
      vim.keymap.set("n", "<leader>x", require("plugin").action)
    end,
  },
}
```

Use `lua/config/keymaps.lua` only for keymaps that do not belong to a plugin.

## Removing a plugin

1. Delete its file from `lua/plugins/`.
2. If the plugin was part of a feature bundle, remove only that spec from the bundle.
3. Run `:Lazy clean` to remove unused plugin files.
4. Remove any unused LSP, snippet, style, or ftplugin files only if they were dedicated to that plugin.

## Keymap placement

- Core/editor keymaps: `lua/config/keymaps.lua`.
- Plugin keymaps: plugin file in `lua/plugins/`.
- Filetype-specific keymaps: `after/ftplugin/<filetype>.lua` or buffer-local maps created by the plugin spec.

## LSP placement

- Add a server config as `lsp/<server>.lua`.
- Add the server name to `vim.lsp.enable({ ... })` in `lua/config/lsp.lua`.
- Keep filetype-specific LSP behavior in `after/ftplugin/` when needed.
