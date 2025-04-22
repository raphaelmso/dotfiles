return {
    'vyfor/cord.nvim',
    build = ':Cord update',
    opts = {},
    keys = {
            { "<leader>nd", "<cmd>Cord toggle<cr>", desc = "Discord Rich Presence", },
    }
}
