return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = function()
            local gitsigns = require('gitsigns')
            gitsigns.setup()

            vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, { desc = "Stage Hunk" })
            vim.keymap.set('n', '<leader>gd', ":Gitsigns diffthis vertical=true<CR>", { desc = "Diff Buffer" })
            vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, { desc = "Reset Hunk" })
            vim.keymap.set('n', '<leader>gR', gitsigns.reset_buffer, { desc = "Reset Buffer" })
            vim.keymap.set('n', '<leader>gb', function() gitsigns.blame_line { full = true } end, { desc = "Blame Line" })
            vim.keymap.set('n', '<leader>gB', gitsigns.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
        end,
    },

}
