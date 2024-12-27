return {
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>yf",
                "<cmd>Yazi<cr>",
                desc = "Current file",
            },
            {
                "<leader>yd",
                "<cmd>Yazi cwd<cr>",
                desc = "Working directory",
            },
            {
                "<leader>yr",
                "<cmd>Yazi toggle<cr>",
                desc = "Resume last session",
            },
        },
    }
}
