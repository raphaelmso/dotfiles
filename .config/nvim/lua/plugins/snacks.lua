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
        { "<leader>:",       function() Snacks.picker.command_history() end,      desc = "Command History" },
        -- find
        { "<leader>fb",      function() Snacks.picker.buffers() end,              desc = "Buffers" },
        { "<leader>ff",      function() Snacks.picker.files() end,                desc = "Find Files" },
        { "<leader>fg",      function() Snacks.picker.git_files() end,            desc = "Find Git Files" },
        { "<leader>fr",      function() Snacks.picker.recent() end,               desc = "Recent" },
        -- git
        { "<leader>gc", function() Snacks.picker.git_log() end,              desc = "Git Log" },
        { "<leader>gs", function() Snacks.picker.git_status() end,           desc = "Git Status" },
        -- Grep
        { "<leader>sb",      function() Snacks.picker.lines() end,                desc = "Buffer Lines" },
        { "<leader>sB",      function() Snacks.picker.grep_buffers() end,         desc = "Grep Open Buffers" },
        { "<leader>sg",      function() Snacks.picker.grep() end,                 desc = "Grep" },
        { "<leader>sw",      function() Snacks.picker.grep_word() end,            desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { '<leader>s"',      function() Snacks.picker.registers() end,            desc = "Registers" },
        { "<leader>sa",      function() Snacks.picker.autocmds() end,             desc = "Autocmds" },
        { "<leader>sc",      function() Snacks.picker.command_history() end,      desc = "Command History" },
        { "<leader>sC",      function() Snacks.picker.commands() end,             desc = "Commands" },
        { "<leader>sd",      function() Snacks.picker.diagnostics() end,          desc = "Diagnostics" },
        { "<leader>sh",      function() Snacks.picker.help() end,                 desc = "Help Pages" },
        { "<leader>sH",      function() Snacks.picker.highlights() end,           desc = "Highlights" },
        { "<leader>sj",      function() Snacks.picker.jumps() end,                desc = "Jumps" },
        { "<leader>sk",      function() Snacks.picker.keymaps() end,              desc = "Keymaps" },
        { "<leader>sl",      function() Snacks.picker.loclist() end,              desc = "Location List" },
        { "<leader>sM",      function() Snacks.picker.man() end,                  desc = "Man Pages" },
        { "<leader>sm",      function() Snacks.picker.marks() end,                desc = "Marks" },
        { "<leader>sR",      function() Snacks.picker.resume() end,               desc = "Resume" },
        { "<leader>sq",      function() Snacks.picker.qflist() end,               desc = "Quickfix List" },
        { "<leader>uC",      function() Snacks.picker.colorschemes() end,         desc = "Colorschemes" },
        { "<leader>qp",      function() Snacks.picker.projects() end,             desc = "Projects" },
        -- LSP
        { "gd",              function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition" },
        { "gr",              function() Snacks.picker.lsp_references() end,       nowait = true,                     desc = "References" },
        { "gI",              function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
        { "gy",              function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,          desc = "LSP Symbols" },

        { "<leader>fn",      function() Snacks.notifier.show_history() end,       desc = "Notification History" },
        { "<leader>gl",      function() Snacks.lazygit() end,                     desc = "Lazygit" },
        { "<leader>nn",      function() Snacks.notifier.hide() end,               desc = "Dismiss All Notifications" },
    }
}
