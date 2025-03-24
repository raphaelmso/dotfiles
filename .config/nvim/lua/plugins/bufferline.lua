return {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({

            options = {
                style_preset = bufferline.style_preset.minimal,
                show_buffer_close_icons = false,
                show_close_icon = false,
                indicator = {
                    style = 'none'
                },
                separator_style = 'slant'
            },
            highlights = {
                fill = {
                    bg = '#16161e',
                },
            }

        })

        vim.keymap.set('n', '<leader>nb', ':BufferLinePickClose<CR>', { desc = "Close Buffer" })
        vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { desc = "Next" })
        vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { desc = "Prev" })
    end
}
