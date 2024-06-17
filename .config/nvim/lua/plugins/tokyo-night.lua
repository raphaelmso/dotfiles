return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("tokyonight").setup({
            style = "night",
            on_colors = function(colors)
                colors.bg = "#050505"
                colors.bg_dark = "#050505"
                colors.bg_float = "#050505"
                colors.bg_popup = "#050505"
                colors.bg_sidebar = "#050505"
                colors.bg_statusline = "#050505"

                colors.bg_highlight = "#16161e"
                colors.bg_visual = "#16161e"
            end,
        })

        vim.cmd([[colorscheme tokyonight]])
    end,
}
