require("obsidian").setup({
  workspaces = { { name = "obsidian", path = "~/gDrive/1_obsidian", } },
  new_notes_location = "current_dir",
  preferred_link_style = "wiki",
  wiki_link_func = "use_alias_only",
  open_app_foreground = true,
  disable_frontmatter = true,
  mappings = {
    ["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
  },
  note_path_func = function(spec) return (spec.dir / spec.title):with_suffix(".md") end,
  completion = {
    nvim_cmp = true,
    min_chars = 2
  },
  picker = { name = "telescope.nvim" },
  -- what to do if :ObsidianOpenLink called on a non-file link (e.g. URL)
  follow_url_func = function(url) vim.fn.jobstart({ "xdg-open", url }) end,
  ui = { enable = false },
})

require('render-markdown').setup({
  render_modes = { 'n', 'c', 't', 'v', 'V', 'i', 'x', '\22' },
  file_types = { 'markdown' },
  heading = {
    width = { 'full', 'block' },
    position = 'inline',
    min_width = { 100, 70, 40, 30, 30, 30 },
    right_pad = 2,
  },
  code = {
    width = 'block',
    right_pad = 2,
    min_width = 35,
  },
  bullet = { icons = { '' } },
  link = {
    wiki = { icon = ' ', highlight = 'RenderMarkdownWikiLink' },
  },
  sign = { enabled = false },
  anti_conceal = {
    ignore = {
      head_background = true,
    }
  }
})
