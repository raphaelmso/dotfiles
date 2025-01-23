vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear highlights" })
keymap.set("n", "<leader>nc", ":checkhealth<CR>", { desc = "Check Health" })

keymap.set("n", "x", '"_x', { desc = "Delete character" })

keymap.set("n", "<leader>=", "<C-a>", { desc = "Increase number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrease number" })

keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write buffer" })
keymap.set("n", "<leader>a", ":wa<CR>", { desc = "Write all buffers" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Vertical" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Horizontal" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equal" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close" })
keymap.set("n", "<leader>si", "<C-w>>", { desc = "Increase Horizontal" })
keymap.set("n", "<leader>sd", "<C-w><", { desc = "Decrease Horizontal" })
keymap.set("n", "<leader>sk", "<C-w>+", { desc = "Increase Vertical" })
keymap.set("n", "<leader>sj", "<C-w>-", { desc = "Decrease Vertical" })

keymap.set("n", "<leader>k", "<C-u>zz", { desc = "Jump up" })
keymap.set("n", "<leader>j", "<C-d>zz", { desc = "Jump down" })


keymap.set('n', '<C-h>', '<C-w>h', { desc = "Left Buffer", noremap = true, silent = true })
keymap.set('n', '<C-j>', '<C-w>j', { desc = "Down Buffer", noremap = true, silent = true })
keymap.set('n', '<C-k>', '<C-w>k', { desc = "Up Buffer", noremap = true, silent = true })
keymap.set('n', '<C-l>', '<C-w>l', { desc = "Right", noremap = true, silent = true })
