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
                        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
                        vim.keymap.set("n", "K", ":RustLsp hover actions<cr>", { desc = "Hover Actions" })
                        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
                        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
                        vim.keymap.set("n", "<leader>ca", ":RustLsp codeAction<cr>", { desc = "Code Actions" })
                        vim.keymap.set("n", "<leader>le", ":RustLsp explainError<cr>", { desc = "Explain Error" })

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
                        vim.keymap.set("n", "<F1>", ":RustLsp run<cr><cr>", { desc = "Run" })
                        vim.keymap.set("n", "<F2>", ":RustLsp runnables<cr>", { desc = "Runnables" })
                        vim.keymap.set("n", "<F5>", ":RustLsp debug<cr>", { desc = "Debug" })
                        vim.keymap.set("n", "<F6>", ":RustLsp debuggables<cr>", { desc = "Debuggables" })
                        vim.keymap.set("n", "<F10>", ":lua require('dap').step_over()<cr>", { desc = "Step Over" })
                        vim.keymap.set("n", "<F11>", ":lua require('dap').step_into()<cr>", { desc = "Step Into" })
                        vim.keymap.set("n", "<F12>", ":lua require('dap').step_out()<cr>", { desc = "Step Out" })
                        vim.keymap.set("n", "<leader>dl", ":lua require('dap').run_last()<cr>", { desc = "Run Last" })
                        vim.keymap.set("n", "<leader>dq", ":lua require('dap').terminate()<cr>", { desc = "Terminate" })
                        -- vim.keymap.set("n", "<space>ç", function()
                        -- require("dapui").eval(nil, { enter = true })
                        -- end) -- thanks TJ DeVries
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
        tag = "stable",
        config = function()
            require("crates").setup()
        end,
    },
}
