-- friendly snippets
require("luasnip.loaders.from_vscode").lazy_load({ exclude = { "markdown", "all" } })
-- custom snippets
require("luasnip.loaders.from_snipmate").lazy_load({ paths = "./after/plugin/snippets" })

local cmp = require('cmp')
local select_opts = { behavior = cmp.SelectBehavior.Select }
local ls = require('luasnip')

-- completion setup
cmp.setup({
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end
  },
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
  mapping = cmp.mapping.preset.insert({
    ['<C-x><C-p>'] = cmp.mapping.complete(), -- trigger completion menu
    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- If the completion menu is visible, move to the next item. If in a
    -- jumpable snippet, jump. If the line is "empty", insert a Tab character.
    -- If the cursor is inside a word, trigger the completion menu
    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1
      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif ls.locally_jumpable(1) then
        ls.jump(1)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, { 'i', 's' }),
    -- If the completion menu is visible, move to the previous item
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      elseif ls.locally_jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = '󰅩',
        luasnip  = '󰘖',
        buffer   = '',
        path     = '',
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})

