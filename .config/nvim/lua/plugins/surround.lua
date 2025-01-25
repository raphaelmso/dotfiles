return {

    "echasnovski/mini.surround",
    event = "VeryLazy",
    config = function()
        require("mini.surround").setup({

            mappings = {
                add = "<leader>za",
                delete = "<leader>zd",
                find = "<leader>zf",
                find_left = "<leader>zF",
                highlight = "<leader>zh",
                replace = "<leader>zr",
                update_n_lines = "<leader>zn",

                suffix_last = "l",
                suffix_next = "n",
            },
        })
    end,
}
