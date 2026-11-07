return {
  -- Colorschemes: all installed, none activates itself.
  { "folke/tokyonight.nvim",    lazy = false, priority = 1000 },
  { "catppuccin/nvim",          name = "catppuccin", lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim",    lazy = false, priority = 1000 },
  { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
  { "rose-pine/neovim",         name = "rose-pine", lazy = false, priority = 1000 },

  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-lualine/lualine.nvim", opts = { options = { theme = "auto" } } },
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
  { "lewis6991/gitsigns.nvim", opts = {} },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    opts = {},
  },
}
