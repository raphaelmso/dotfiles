return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gitsigns = require('gitsigns')
            local fzf = require("fzf-lua")
            gitsigns.setup()

            vim.keymap.set('n', '<leader>gb', function() gitsigns.blame_line { full = true } end, { desc = "Blame Line" })
            vim.keymap.set('n', '<leader>gB', gitsigns.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
            vim.keymap.set('n', '<leader>gdo', ":DiffviewOpen<CR>", { desc = "Diff View Open" })
            vim.keymap.set('n', '<leader>gdc', ":DiffviewClose<CR>", { desc = "Diff View Close" })
            vim.keymap.set('n', '<leader>gdh', ":DiffviewFileHistory<CR>", { desc = "Diff View File History" })
            vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Select Hunk" })

            vim.keymap.set("n", "<leader>gff", fzf.git_files, { desc = "Files" })
            vim.keymap.set("n", "<leader>gfs", fzf.git_status, { desc = "Status" })
            vim.keymap.set("n", "<leader>gfp", fzf.git_commits, { desc = "Commits Log (Project)" })
            vim.keymap.set("n", "<leader>gfl", fzf.git_bcommits, { desc = "Commit Log (Buffer)" })
            vim.keymap.set("n", "<leader>gfb", fzf.git_blame, { desc = "Blame (Buffer)" })
            vim.keymap.set("n", "<leader>gfr", fzf.git_branches, { desc = "Branches" })
            vim.keymap.set("n", "<leader>gft", fzf.git_tags, { desc = "Tags" })
            vim.keymap.set("n", "<leader>gfs", fzf.git_stash, { desc = "Stash" })
        end,
    },
    {
        "sindrets/diffview.nvim",
    }
}
