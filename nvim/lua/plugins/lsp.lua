return {
  -- lsp
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },

  -- formatter
  { 'stevearc/conform.nvim' },

  {
    "folke/trouble.nvim",
    opts = {
      {
        modes = {
          test = {
            mode = "diagnostics",
            preview = {
              type = "split",
              relative = "win",
              position = "right",
              size = 0.4,
            },
          },
        },
      }
    },
    cmd = "Trouble",
    keys = {
      {
        "<leader>td",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tb",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
    },
  },

  { 'mfussenegger/nvim-jdtls' },
}
