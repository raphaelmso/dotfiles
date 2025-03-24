return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                on_highlights = function(hl,c)
                    hl.LspInlayHint = {
                        fg = "#9ece6a",
                    }
                end
            })
            vim.cmd([[colorscheme tokyonight-night]])
        end
    },
}
