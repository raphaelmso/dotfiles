return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        require("oil").setup({
            float = {
                max_height = 10,
                max_width = 80,
            }
        })
    end,

    vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" }),
}
