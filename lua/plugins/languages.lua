return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "python", "c", "cpp", "rust", "java",
        "markdown", "markdown_inline", "lua", "vim", "vimdoc",
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python", "c", "cpp", "rust", "java", "markdown", "mdx" },
        callback = function() pcall(vim.treesitter.start) end,
      })
    end,
  },
  { "mrcjkb/rustaceanvim", version = "^6", lazy = false },
  { "mfussenegger/nvim-jdtls", ft = "java" },
}
