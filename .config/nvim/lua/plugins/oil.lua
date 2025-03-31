return {
    'stevearc/oil.nvim',
    keys = {
        {"-", "<CMD>Oil<CR>", desc = "Open parent diractory"}
    },
    config = function()
        require("oil").setup()
    end
}
