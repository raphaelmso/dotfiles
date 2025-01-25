return {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    config = function()
        require("fidget").setup({
            notification = {
                window = {
                    winblend = 0,
                },
            },
        })
        vim.keymap.set("n", "<leader>nf", ":Fidget clear<CR>", {desc = "Clear Fidget"})
    end,
}
