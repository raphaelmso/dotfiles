return {
    "folke/snacks.nvim",

    priority = 1000,
    lazy = false,
    ---@type snacks.Config

    opts = {
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        health = { enabled = true },
        image = {enabled = true},
        indent = {
            enabled = true,
            animate = {
                enabled = false,
            }
        },
        gitbrowse = { enabled = true },
        input = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = true },
        notify = { enabled = true },
        picker = { enabled = true },
        util = { enabled = true },

    },
    keys = {

        { "<leader>go",      function() Snacks.gitbrowse() end,                   desc = "Browse" },
        { "<leader>fn",      function() Snacks.notifier.show_history() end,       desc = "Notification History" },
        { "<leader>gl",      function() Snacks.lazygit() end,                     desc = "Lazygit" },
        { "<leader>nn",      function() Snacks.notifier.hide() end,               desc = "Dismiss All Notifications" },

        { "<leader>o",       function() Snacks.picker.files() end,                desc = "File" },
        { "<leader>r",       function() Snacks.picker.grep() end,                 desc = "String" },
        { "<leader><space>", function() Snacks.picker.buffers() end,              desc = "Buffers" },
        { "<leader>fs",      function() Snacks.picker.grep_word() end,            desc = "String under cursor" },
        { "<leader>fx",      function() Snacks.picker.picker() end,               desc = "Builtin" },
        { "<leader>fh",      function() Snacks.picker.help() end,                 desc = "Help" },
        { "<leader>fk",      function() Snacks.picker.keymaps() end,              desc = "Keymaps" },
        { "<leader>fq",      function() Snacks.picker.qflist() end,               desc = "Quickfix" },
        { "<leader>fl",      function() Snacks.picker.lines() end,                desc = "Local string" },
        { "<leader>fo",      function() Snacks.picker.recent() end,               desc = "Old Files" },
        { "<leader>fd",      function() Snacks.picker.lsp_definitions() end,      desc = "Definitions" },
        { "<leader>fD",      function() Snacks.picker.lsp_declarations() end,     desc = "Declarations" },
        { "<leader>ft",      function() Snacks.picker.lsp_type_definitions() end, desc = "Type Definitions" },
        { "<leader>fi",      function() Snacks.picker.lsp_implementations() end,  desc = "Implementations" },
        { "<leader>fa",      function() Snacks.picker.lsp_symbols() end,          desc = "LSP Symbols" },
        { "<leader>fr",      function() Snacks.picker.lsp_references() end,       desc = "All LSP locations" },
        { "<leader>fc",      function() Snacks.picker.todo_comments() end,        desc = "ToDo Comments" },

        { "<leader>gff",     function() Snacks.picker.git_files() end,            desc = "Find Git Files" },
        { "<leader>gfb",     function() Snacks.picker.git_branches() end,         desc = "Git Branches" },
        { "<leader>gfl",     function() Snacks.picker.git_log() end,              desc = "Git Log" },
        { "<leader>gfL",     function() Snacks.picker.git_log_line() end,         desc = "Git Log Line" },
        { "<leader>gfs",     function() Snacks.picker.git_status() end,           desc = "Git Status" },
        { "<leader>gfS",     function() Snacks.picker.git_stash() end,            desc = "Git Stash" },
        { "<leader>gfd",     function() Snacks.picker.git_diff() end,             desc = "Git Diff (Hunks)" },
        { "<leader>gfb",     function() Snacks.picker.git_log_file() end,         desc = "Git Log Buffer" },


    }
}
