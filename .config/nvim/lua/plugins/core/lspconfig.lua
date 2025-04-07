return {
    --  TODO: Remove lspconfig after 0.11
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",

        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            disable = { "missing-fields" },
                        }
                    },
                },
            })

            lspconfig.clangd.setup({
                cmd = {
                    "clangd",
                    "--fallback-style=webkit"
                }
            })


            vim.diagnostic.config {
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "󰀪",
                        [vim.diagnostic.severity.HINT] = "",
                        [vim.diagnostic.severity.INFO] = "󰋼",
                    },
                },
            }

            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration", })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Actions" })
            vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
            vim.keymap.set("n", "gK", function() return vim.lsp.buf.signature_help() end, { desc = "Signature Help" })
            vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })

            vim.keymap.set("n", "<leader>ch", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
                { desc = "Toggle Inlay Hints", silent = true })

            vim.keymap.set('n', '<leader>cv', function()
                local new_config = not vim.diagnostic.config().virtual_lines
                vim.diagnostic.config({ virtual_lines = new_config })
            end, { desc = 'Toggle diagnostic virtual_lines', silent = true })

            vim.keymap.set("n", "<leader>ni", ":LspInfo<cr>", { desc = "LSP Info" })
            vim.keymap.set("n", "<leader>nl", ":Lazy<cr>", { desc = "Lazy" })
        end,
    },

}
