require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", "ss", "<cmd>w<CR>")
map("i", "ss", "<ESC><cmd>w<CR>")

-- Override NvChad default: change <leader>e to toggle instead of focus
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
