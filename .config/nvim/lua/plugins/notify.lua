return {
    {
        'echasnovski/mini.nvim',
        version = '*',
        config = function()
            local notify = require("mini.notify")
            notify.setup({
                window = {
                    config = {
                        border = "none"
                    },
                    winblend = 0,
                },
            })
            vim.notify = notify.make_notify()

            vim.keymap.set("n", "<leader>fn", ":split | resize 10 | lua MiniNotify.show_history()<CR> | G",
                { desc = "Notifications (buf)" })
        end
    },
}
