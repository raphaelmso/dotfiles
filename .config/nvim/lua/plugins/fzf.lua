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
        vim.keymap.set("n", "<leader>fs", require('fzf-lua').live_grep, { desc = "String" })
        vim.keymap.set("n", "<leader>fc", require("fzf-lua").grep_cWORD,
            { desc = "String under cursor" })
        vim.keymap.set("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Buffers" })
        vim.keymap.set("n", "<leader>fh", require("fzf-lua").helptags, { desc = "Help" })
        vim.keymap.set("n", "<leader>fk", require("fzf-lua").keymaps, { desc = "Keymaps" })
        vim.keymap.set("n", "<leader>fl", require("fzf-lua").grep_curbuf,
            { desc = "Local string" })
        vim.keymap.set("n", "<leader>fo", require("fzf-lua").oldfiles, { desc = "Old Files" })
        vim.keymap.set("n", "<leader>fd", require("fzf-lua").lsp_definitions, { desc = "Definitions" })
        vim.keymap.set("n", "<leader>fD", require("fzf-lua").lsp_declarations, { desc = "Declarations" })
        vim.keymap.set("n", "<leader>ft", require("fzf-lua").lsp_typedefs, { desc = "Type Definitions" })
        vim.keymap.set("n", "<leader>fi", require("fzf-lua").lsp_implementations, { desc = "Implementations" })
        vim.keymap.set("n", "<leader>fa", require("fzf-lua").lsp_finder, { desc = "All LSP locations" })
    end,

}
