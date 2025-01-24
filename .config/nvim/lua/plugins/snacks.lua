return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config

    opts = {
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        health = { enabled = true },
        indent = {
            enabled = true,
            animate = {
                enabled = false,
            }
        },
        input = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = true },
        notify = { enabled = true },
        statuscolumn = {
            enabled = true,
            left = { "sign", "mark" },
        },
        util = { enabled = true },

    },
    keys = {
        { "<leader>Fn",  function() Snacks.notifier.show_history() end,  desc = "Notification History" },
        { "<leader>gl",  function() Snacks.lazygit() end,                desc = "Lazygit" },
        { "<leader>nn",  function() Snacks.notifier.hide() end,          desc = "Dismiss All Notifications" },
    }
}
