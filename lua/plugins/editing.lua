return {
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "tpope/vim-commentary", event = "VeryLazy" },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>",     desc = "Find files" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>",   desc = "Buffers" },
      { "<leader>fh", "<cmd>FzfLua helptags<cr>",  desc = "Help" },
      { "<leader>uc", "<cmd>FzfLua colorschemes<cr>", desc = "Pick NeoVim colorscheme" },
    },
    opts = {},
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "mdx" },
    opts = { file_types = { "markdown", "mdx" } },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        rust = { "rustfmt" },
        java = { "google-java-format" },
        markdown = { "prettier" },
        mdx = { "prettier" },
      },
      format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
    },
  },
}
