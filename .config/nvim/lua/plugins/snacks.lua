return {
    "folke/snacks.nvim",
    event = "VeryLazy",
    opts = {
        lazygit = { enabled = true },
        rename = { enabled = true },
        notifier = { enabled = true },
        notify = { enabled = true },
    },
    keys = {
        { "<leader>gl", function() Snacks.lazygit() end,               desc = "Lazygit" },
        { "<leader>nn", function() Snacks.notifier.show_history() end, desc = "Notifications" },
    }
}
