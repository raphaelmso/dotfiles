return {
    "folke/snacks.nvim",
    event = "VeryLazy",
    opts = {
        lazygit = { enabled = true },
        rename = { enabled = true },
        notifier = { enabled = true },
        notify = { enabled = true },
        explorer = {
            enabled = true,
            replace_netrw = true,
            trash = true,
        },
    },
    keys = {
        { "<leader>gl", function() Snacks.lazygit() end,               desc = "Lazygit" },
        { "<leader>nn", function() Snacks.notifier.show_history() end, desc = "Notifications" },
        { "<leader>e",  function() Snacks.explorer() end, desc = "File Explorer" },
    }
}
