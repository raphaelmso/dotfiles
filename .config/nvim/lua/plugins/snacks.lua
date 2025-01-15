return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config

    opts = {
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
        picker = { enabled = true },
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
        { "<leader>:",   function() Snacks.picker.command_history() end, desc = "Command History" },
        -- find
        { "<leader>fb",  function() Snacks.picker.buffers() end,         desc = "Buffers" },
        { "<leader>ff",  function() Snacks.picker.files() end,           desc = "Find Files" },
        { "<leader>fr",  function() Snacks.picker.recent() end,          desc = "Recent" },
        -- git
        { "<leader>fgf", function() Snacks.picker.git_files() end,       desc = "Find Git Files" },
        { "<leader>fgl", function() Snacks.picker.git_log() end,         desc = "Git Log" },
        { "<leader>fgs", function() Snacks.picker.git_status() end,      desc = "Git Status" },
        -- Grep
        { "<leader>fl",  function() Snacks.picker.lines() end,           desc = "Buffer Lines" },
        { "<leader>fB",  function() Snacks.picker.grep_buffers() end,    desc = "Grep Open Buffers" },
        { "<leader>fs",  function() Snacks.picker.grep() end,            desc = "Grep" },
        { "<leader>fw",  function() Snacks.picker.grep_word() end,       desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { '<leader>f"',  function() Snacks.picker.registers() end,       desc = "Registers" },
        { "<leader>fc",  function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>fC",  function() Snacks.picker.commands() end,        desc = "Commands" },
        { "<leader>fd",  function() Snacks.picker.diagnostics() end,     desc = "Diagnostics" },
        { "<leader>fh",  function() Snacks.picker.help() end,            desc = "Help Pages" },
        { "<leader>sj",  function() Snacks.picker.jumps() end,           desc = "Jumps" },
        { "<leader>fk",  function() Snacks.picker.keymaps() end,         desc = "Keymaps" },
        { "<leader>fm",  function() Snacks.picker.marks() end,           desc = "Marks" },
        { "<leader>sq",  function() Snacks.picker.qflist() end,          desc = "Quickfix List" },
        -- LSP

        { "<leader>fn",  function() Snacks.notifier.show_history() end,  desc = "Notification History" },
        { "<leader>gl",  function() Snacks.lazygit() end,                desc = "Lazygit" },
        { "<leader>nn",  function() Snacks.notifier.hide() end,          desc = "Dismiss All Notifications" },
    }
}
