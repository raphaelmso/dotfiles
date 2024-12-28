return {
    {
        'echasnovski/mini.nvim',
        version = '*',
        config = function()
            local notify = require("mini.notify")
            notify.setup({
                lsp_progress = {
                    duration_last = 300,
                },
                window = {
                    config = {
                        border = "none"
                    },

                    max_width_share = 0.3,
                    winblend = 0,
                },
            })
            vim.notify = notify.make_notify()

            vim.keymap.set("n", "<leader>fn", ":split | resize 10 | lua MiniNotify.show_history()<CR> | G",
                { desc = "Notifications (buf)" })
        end
    },
}
