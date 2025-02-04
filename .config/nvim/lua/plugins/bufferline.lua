return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = function()
        require("bufferline").setup({
            highlights = {
                fill = {
                    bg = "#16161e",
                },
                background = {
                    bg = "#16161e",
                },
                buffer_selected = {
                    bg = "#1a1b26",
                },
                close_button_selected = {
                    bg = "#1a1b26",
                },

            },
            options = {
                buffer_close_icon = '',
                close_icon = '',
                indicator = {
                    style = "none"
                },
            }
        })
        vim.keymap.set('n', '<leader>nb', ':BufferLinePickClose<CR>', { desc = "Close Buffer" })
        vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { desc = "Next" })
        vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { desc = "Prev" })
    end
}
