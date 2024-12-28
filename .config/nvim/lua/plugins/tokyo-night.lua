return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "night",
            on_colors = function(colors)
                colors.bg = "#16161e"
                colors.bg_popup = "#0c0c14"
                colors.bg_dark = "#0c0c14"
                colors.bg_dark1 = "#0c0c14"
                colors.bg_statusline = "#0c0c14"
            end


        })

        vim.cmd([[colorscheme tokyonight]])
    end,
}
