-- friendly snippets
require("luasnip.loaders.from_vscode").lazy_load({ exclude = { "markdown", "all" } })
-- custom snippets
require("luasnip.loaders.from_snipmate").lazy_load({ paths = "./after/plugin/snippets" })
