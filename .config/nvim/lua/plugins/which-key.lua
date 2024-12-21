return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps",
        },
    },
    opts = {
        preset = "helix",
        icons = {
            mappings = false,
        },
    },
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500

        vim.keymap.set("n", "<leader>c", "", { desc = "Code" })
        vim.keymap.set("n", "<leader>d", "", { desc = "Debug" })
        vim.keymap.set("n", "<leader>f", "", { desc = "Find" })
        vim.keymap.set("n", "<leader>l", "", { desc = "LSP" })
        vim.keymap.set("n", "<leader>s", "", { desc = "Split" })
        vim.keymap.set("n", "<leader>t", "", { desc = "Diagnostics" })
        vim.keymap.set("n", "<leader>z", "", { desc = "Surround" })
    end,
}
