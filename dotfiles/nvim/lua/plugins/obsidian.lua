return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- use latest release instead of latest commit
    lazy = true,
    event = {      -- only load obsidian.nvim for markdown files in my vault
      "BufReadPre /home/shenkit/gDrive/1_obsidian/**",
      "BufNewFile /home/shenkit/gDrive/1_obsidian/**",
    },
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "hrsh7th/nvim-cmp",      -- note reference completion
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  { "dhruvasagar/vim-table-mode" },
  { "bullets-vim/bullets.vim" },
}

