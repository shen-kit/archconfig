return {
  -- cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  { "saadparwaiz1/cmp_luasnip" },

  -- auto-add closing tags in javascript/typescript
  { "windwp/nvim-ts-autotag" },
}
