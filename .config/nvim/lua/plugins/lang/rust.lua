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

                        vim.keymap.set(
                            "n",
                            "<leader>dB",
                            ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
                            { desc = "Breakpoint Condition" }
                        )
                        vim.keymap.set(
                            "n",
                            "<leader>db",
                            ":lua require('dap').toggle_breakpoint()<cr>",
                            { desc = "Toggle Breakpoint" }
                        )
                        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
                        vim.keymap.set("n", "K", ":RustLsp hover actions<cr>", { desc = "Hover Actions" })
                        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
                        vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, { desc = "Rename" })
                        vim.keymap.set("n", "<leader>ca", ":RustLsp codeAction<cr>", { desc = "Actions" })
                        vim.keymap.set("n", "<leader>ce", ":RustLsp explainError<cr>", { desc = "Explain Error" })
                        vim.keymap.set("n", "<leader>cc", ":RustLsp relatedDiagnostics<cr>",
                            { desc = "Related Diagnostics" })


                        vim.keymap.set("n", "<leader>cr", ":RustLsp run<cr><cr>", { desc = "Run Code" })
                        vim.keymap.set("n", "<leader>cR", ":RustLsp runnables<cr>", { desc = "Runnables" })
                        vim.keymap.set("n", "<leader>dr", ":RustLsp debug<cr>", { desc = "Run Debug" })
                        vim.keymap.set("n", "<leader>dR", ":RustLsp debuggables<cr>", { desc = "Debuggables" })
                        vim.keymap.set("n", "<leader>do", ":lua require('dap').step_over()<cr>", { desc = "Step Over" })
                        vim.keymap.set("n", "<leader>di", ":lua require('dap').step_into()<cr>", { desc = "Step Into" })
                        vim.keymap.set("n", "<leader>du", ":lua require('dap').step_out()<cr>", { desc = "Step Out" })
                        vim.keymap.set("n", "<leader>dl", ":lua require('dap').run_last()<cr>", { desc = "Run Last" })
                        vim.keymap.set("n", "<leader>dq", ":lua require('dap').terminate()<cr>", { desc = "Terminate" })
                    end,
                    default_settings = {
                        ["rust-analyzer"] = {},
                    },
                },
                dap = {},
            }
            vim.g.rustaceanvim.dap.autoload_configurations = true
        end,
    },

    {
        "saecki/crates.nvim",
        event = "VeryLazy",
        tag = "stable",
        config = function()
            require("crates").setup({})
        end,
    },
}
