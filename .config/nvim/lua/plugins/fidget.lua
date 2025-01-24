return {
    "j-hui/fidget.nvim",
    config = function()
        require("fidget").setup({
            notification = {
                window = {
                    winblend = 0,
                },
            },
        })
        vim.keymap.set("n", "<leader>nf", ":Fidget clear ", {desc = "Clear Fidget"})
    end,
}
