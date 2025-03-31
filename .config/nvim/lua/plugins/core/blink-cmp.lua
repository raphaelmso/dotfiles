return {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
        { "folke/tokyonight.nvim" }
    },
    version = "v0.*",

    opts = {
        keymap = {
            preset = "default",

            ["<CR>"] = { "select_and_accept", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down" },
            ["<C-u>"] = { "scroll_documentation_up" },
        },
        completion = {
            menu = {
                draw = {
                    treesitter = { "lsp" },
                    columns = {
                        { "kind_icon", "label", gap = 2 },
                        { "kind" },
                    },
                },

            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },

        },
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "mono",
            kind_icons = {
                Text = '󱀍',
                Method = '󰡱',
                Function = '󰊕',
                Constructor = '󰒓',

                Field = '',
                Variable = '',
                Property = '󰖷',

                Class = '',
                Interface = '',
                Struct = '',
                Module = '󰅩',

                Unit = '',
                Value = '',
                Enum = '',
                EnumMember = '',

                Keyword = '',
                Constant = '󰏿',

                Snippet = '',
                Color = '󰏘',
                File = '󰈔',
                Reference = '',
                Folder = '󰉋',
                Event = '󱐋',
                Operator = '',
                TypeParameter = '',
            },
        },

        sources = {
            default = { "snippets", "lsp", "path", "buffer" },
        },
    },
    opts_extend = { "sources.default" },
}
