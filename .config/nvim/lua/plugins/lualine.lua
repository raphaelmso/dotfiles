return {
    "nvim-lualine/lualine.nvim",
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
                    {
                        "filename",
                        path = 1
                    },
                    "branch",
                    "diff",
                    "diagnostics",
                },
                lualine_x = { "filesize", "progress", "location" },
                lualine_y = {},
                lualine_z = {},
            },
            inactive_sections = {
                lualine_c = {
                    {
                        "filename",
                        path = 1
                    },
                }
            }

        })
    end,
}
