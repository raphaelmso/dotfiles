vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>=", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>a", ":wa<CR>")

-- keymap.set("n", "<A-r>", "<C-r>", { noremap = true, silent = true })
-- keymap.set("n", "<A-v>", "<C-v>", { noremap = true, silent = true })

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")
keymap.set("n", "<leader>si", "<C-w>>")
keymap.set("n", "<leader>sd", "<C-w><")

keymap.set("n", "C-u", "<C-u>zz")
keymap.set("n", "C-d", "<C-d>zz")
