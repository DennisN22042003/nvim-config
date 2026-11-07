local map = vim.keymap.set
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit window" })
map("i", "jk", "<esc>", { desc = "Escape" })
map("n", "<esc>", "<cmd>nohlsearch<cr>")
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "File tree" })
map("n", "<leader>uc", "<cmd>FzfLua colorschemes<cr>", { desc = "Pick colorscheme" })
