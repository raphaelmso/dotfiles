return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            local gitsigns = require('gitsigns')
            local fzf = require("fzf-lua")
            gitsigns.setup()

            vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, { desc = "Stage Hunk" })
            vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, { desc = "Reset Hunk" })
            vim.keymap.set('n', '<leader>gR', gitsigns.reset_buffer, { desc = "Reset Buffer" })
            vim.keymap.set('n', '<leader>gb', function() gitsigns.blame_line { full = true } end, { desc = "Blame Line" })
            vim.keymap.set('n', '<leader>gB', gitsigns.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })


            vim.keymap.set("n", "<leader>gff", fzf.git_files, { desc = "Files" })
            vim.keymap.set("n", "<leader>gfs", fzf.git_status, { desc = "Status" })
            vim.keymap.set("n", "<leader>gfp", fzf.git_commits, { desc = "Commits Log (Project)" })
            vim.keymap.set("n", "<leader>gfl", fzf.git_bcommits, { desc = "Commit Log (Buffer)" })
            vim.keymap.set("n", "<leader>gfb", fzf.git_blame, { desc = "Blame (Buffer)" })
            vim.keymap.set("n", "<leader>gfr", fzf.git_branches, { desc = "Branches" })
            vim.keymap.set("n", "<leader>gft", fzf.git_tags, { desc = "Tags" })
            vim.keymap.set("n", "<leader>gfS", fzf.git_stash, { desc = "Stash" })
        end,
    },
}
