return {
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>e",
                "<cmd>Yazi<cr>",
                desc = "Current file",
            },
            {
                "<leader>Ed",
                "<cmd>Yazi cwd<cr>",
                desc = "Working directory",
            },
            {
                "<leader>Er",
                "<cmd>Yazi toggle<cr>",
                desc = "Resume last session",
            },
        },
    }
}
