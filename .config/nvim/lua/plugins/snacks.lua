return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config

    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        animate = { enabled = false },
        bigfile = { enabled = false },
        bufdelete = { enabled = false },
        dashboard = { enabled = false },
        debug = { enabled = false },
        dim = { enabled = false },
        git = { enabled = false },
        gitbrowse = { enabled = false },
        health = { enabled = true },
        indent = {
            enabled = true,
            animate = {
                enabled = false,
            }
        },
        input = { enabled = false },
        layout = { enabled = false },
        lazygit = { enabled = true },
        meta = { enabled = false },
        notifier = { enabled = true },
        notify = { enabled = true },
        picker = { enabled = false },
        profiler = { enabled = false },
        quickfile = { enabled = false },
        rename = { enabled = false },
        scope = { enabled = false },
        scratch = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = {
            enabled = true,
            left = { "sign", "mark" },
        },
        terminal = { enabled = false },
        toggle = { enabled = false },
        util = { enabled = true },
        win = { enabled = false },
        words = { enabled = false },
        zen = { enabled = false },

    },
    keys = {
        { "<leader>fn", function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "<leader>gl", function() Snacks.lazygit() end,               desc = "Lazygit" },
        { "<leader>xn", function() Snacks.notifier.hide() end,         desc = "Dismiss All Notifications" },
    }
}
