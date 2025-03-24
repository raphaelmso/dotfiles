return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",

    config = function()
        require("lualine").setup({
            options = {

                component_separators = { left = " ", right = " " },
                section_separators = { left = " ", right = " " },
                ignore_focus = {
                    "dapui_watches",
                    "dapui_breakpoints",
                    "dapui_scopes",
                    "dapui_console",
                    "dapui_stacks",
                    "dap-repl",
                },
            },

            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    "mode",
                    "branch",
                    "diff",
                    "diagnostics",
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                },
                lualine_x = { "filesize", "progress", "location" },
                lualine_y = {},
                lualine_z = {},
            },

        })
    end,
}
