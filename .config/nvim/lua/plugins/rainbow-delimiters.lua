return {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPre",
    config = function()
        require("rainbow-delimiters.setup").setup({
            highlight = {
                'RainbowDelimiterViolet',
                'RainbowDelimiterGreen',
                'RainbowDelimiterCyan',
            },
        })
    end
}
