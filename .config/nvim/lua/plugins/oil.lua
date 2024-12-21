return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { 'echasnovski/mini.icons', version = false },
    config = function()
        require("oil").setup()
    end,

    vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" }),
}
