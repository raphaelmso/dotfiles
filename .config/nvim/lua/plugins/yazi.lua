return {
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>y",
                "<cmd>Yazi<cr>",
                desc = "Current file",
            },
            {
                "<leader>Yd",
                "<cmd>Yazi cwd<cr>",
                desc = "Working directory",
            },
            {
                "<leader>Yr",
                "<cmd>Yazi toggle<cr>",
                desc = "Resume last session",
            },
        },
    }
}
