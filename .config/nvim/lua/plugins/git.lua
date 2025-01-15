return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gitsigns = require('gitsigns')
            gitsigns.setup()

            vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, { desc = "Stage Hunk" })
            vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, { desc = "Reset Hunk" })
            vim.keymap.set('v', '<leader>gs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = "Stage Hunk" })
            vim.keymap.set('v', '<leader>gr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = "Reset Hunk" })
            vim.keymap.set('n', '<leader>gS', gitsigns.stage_buffer, { desc = "Stage Buffer" })
            vim.keymap.set('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })
            vim.keymap.set('n', '<leader>gR', gitsigns.reset_buffer, { desc = "Reset Buffer" })
            vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk_inline, { desc = "Preview Hunk" })
            vim.keymap.set('n', '<leader>gb', function() gitsigns.blame_line { full = true } end, { desc = "Blame Line" })
            vim.keymap.set('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
            vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = "Diff This" })
            vim.keymap.set('n', '<leader>gD', function() gitsigns.diffthis('~') end, { desc = "Diff This" })
            vim.keymap.set('n', '<leader>gtd', gitsigns.toggle_deleted, { desc = "Toggle Deleted" })
            vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Select Hunk" })
        end,
    },

}


