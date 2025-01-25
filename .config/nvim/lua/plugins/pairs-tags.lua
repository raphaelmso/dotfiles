return {
    {
        'echasnovski/mini.pairs',
        version = false,
        event = "InsertEnter",
        config = function()
            require('mini.pairs').setup()
        end
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false,
                },
            })
        end,
    },
}
