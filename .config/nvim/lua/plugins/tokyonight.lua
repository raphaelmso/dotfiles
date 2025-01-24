return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup()
            vim.cmd([[colorscheme tokyonight-night]])
            vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#9ece6a", bg = "#24283b" })
        end
    }
}
