return {
    {
        "mrcjkb/rustaceanvim",
        ft = { "rust" },
        config = function()
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            vim.g.rustaceanvim = {
                tools = {
                    hover_actions = {
                        auto_focus = true,
                    },
                },
                server = {
                    on_attach = function(client, bufnr)
                        if client.supports_method("textDocument/formatting") then
                            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                            vim.api.nvim_create_autocmd("BufWritePre", {
                                group = augroup,
                                buffer = bufnr,
                                callback = function()
                                    vim.lsp.buf.format()
                                end,
                            })
                        end

                        vim.keymap.set("n", "K", ":RustLsp hover actions<cr>", { desc = "Hover Actions", silent = true })
                        vim.keymap.set("n", "gra", ":RustLsp codeAction<cr>", { desc = "Actions", silent = true })
                        vim.keymap.set("n", "<leader>ce", ":RustLsp explainError<cr>", { desc = "Explain Error", silent = true })
                        vim.keymap.set("n", "<leader>cc", ":RustLsp relatedDiagnostics<cr>", { desc = "Related Diagnostics", silent = true })
                        vim.keymap.set("n", "<leader>cd", ":RustLsp renderDiagnostic current<cr>", { desc = "Render Diagnostics (Current)", silent = true })
                        vim.keymap.set("n", ",", ":RustLsp renderDiagnostic<cr>", { desc = "Render Diagnostics (Cycle)", silent = true })


                        vim.keymap.set("n", "<leader>cr", ":RustLsp run<cr><cr>", { desc = "Run Code", silent = true })
                        vim.keymap.set("n", "<leader>cR", ":RustLsp runnables<cr>", { desc = "Runnables", silent = true })
                        vim.keymap.set("n", "<leader>ct", ":RustLsp testables<cr>", { desc = "Testables", silent = true })
                        vim.keymap.set("n", "<leader>cl", ":RustLsp! testables<cr>", { desc = "Last Test", silent = true })

                    end,

                    default_settings = {
                        ["rust-analyzer"] = {},
                    },
                },
            }

            vim.g.rustaceanvim.tools.test_executor = "background"

        end,
    },

    {
        "saecki/crates.nvim",
        ft = { "toml" },
        tag = "stable",
        config = function()
            require("crates").setup({})
        end,
    },

    {
        'cordx56/rustowl',
        build = 'cd rustowl && cargo install --path . --locked',
        ft = { "rust" },
        opts = {
            client = {
                on_attach = function(_, buffer)
                    vim.keymap.set('n', '<leader>co', function()
                        require('rustowl').toggle(buffer)
                    end, { buffer = buffer, desc = 'Toggle RustOwl' })
                end
            },
        },
    }

}
