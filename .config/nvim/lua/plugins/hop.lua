return {
    "smoka7/hop.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
        keys = 'etovxqpdygfblzhckisuran'
    },

    config = function()
        require("hop").setup()

        vim.cmd('hi HopNextKey guifg=#2ac3de')
        vim.cmd('hi HopNextKey1 guifg=#2ac3de')
        vim.cmd('hi HopNextKey2 guifg=#9ece6a')
        vim.keymap.set("n", "s", ":HopWordMW<CR>")

    end
}
