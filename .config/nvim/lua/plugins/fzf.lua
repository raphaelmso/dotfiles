return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("fzf-lua").setup({
            keymap = {
                builtin = {
                    ["<C-u>"] = "preview-up",
                    ["<C-d>"] = "preview-down",
                }
            }
        })

        vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "File" })
        vim.keymap.set("n", "<leader>fs", require("fzf-lua").grep, { desc = "String" })
        vim.keymap.set("n", "<leader>fc", require("fzf-lua").grep_cWORD,
            { desc = "String under cursor" })
        vim.keymap.set("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Buffers" })
        vim.keymap.set("n", "<leader>fh", require("fzf-lua").helptags, { desc = "Help" })
        vim.keymap.set("n", "<leader>fk", require("fzf-lua").keymaps, { desc = "Keymaps" })
        vim.keymap.set("n", "<leader>fl", require("fzf-lua").grep_curbuf,
            { desc = "Local string" })
        vim.keymap.set("n", "<leader>fr", require("fzf-lua").oldfiles, { desc = "Keymaps" })
    end,

}
