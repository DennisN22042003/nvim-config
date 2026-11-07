return {
    -- Project-wide diagnostics list ("Problems" Panel)
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = {},
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
            { "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols" },
        },
    },

    -- Show current function/class at the top while scrolling
    { "nvim-treesitter/nvim-treesitter-context", event = "VeryLazy", opts = { max_lines = 3 } },

    -- Indent guides
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", event = "VeryLazy", opts = {} },

    -- Jump anywhere on screen in a few keystrokes
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        keys = { { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" } },
    },

    -- Integrated terminal (for running code, cargo, make, etc.)
      { "akinsho/toggleterm.nvim", keys = { { "<C-\\>", desc = "Terminal" } },
    opts = { open_mapping = [[<C-\>]], direction = "float" } },

    -- Better file editing: file explorer as a buffer
    { "stevearc/oil.nvim", cmd = "Oil", opts = {}, keys = { { "-", "<cmd>Oil<cr>", desc = "Parent dir" } } },

    -- Symbol outline sidebar (functions, classes in the current file)
    { "stevearc/aerial.nvim", opts = {}, keys = { { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Outline" } } },

    -- Git: diffs, blame, and hunk staging
    { "sindrets/diffview.nvim", cmd = "DiffViewOpen" },
    { "tpope/vim-fugitive", cmd = "Git" },

      -- Run and debug tests
  { "nvim-neotest/neotest", cmd = "Neotest",
    dependencies = { "nvim-neotest/nvim-nio", "nvim-lua/plenary.nvim",
                     "nvim-neotest/neotest-python" },
    config = function()
      require("neotest").setup({ adapters = { require("neotest-python") } })
    end },
}
