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

                        -- vim.keymap.set(
                        --     "n",
                        --     "<leader>dB",
                        --     ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
                        --     { desc = "Breakpoint Condition" }
                        -- )
                        -- vim.keymap.set(
                        --     "n",
                        --     "<leader>db",
                        --     ":lua require('dap').toggle_breakpoint()<cr>",
                        --     { desc = "Toggle Breakpoint" }
                        -- )
                        vim.keymap.set("n", "K", ":RustLsp hover actions<cr>", { desc = "Hover Actions", silent = true})
                        vim.keymap.set("n", "gra", ":RustLsp codeAction<cr>", { desc = "Actions", silent = true})
                        vim.keymap.set("n", "<leader>ce", ":RustLsp explainError<cr>", { desc = "Explain Error", silent = true})
                        vim.keymap.set("n", "<leader>cc", ":RustLsp relatedDiagnostics<cr>",
                            { desc = "Related Diagnostics", silent = true})
                        vim.keymap.set("n", "<leader>cd", ":RustLsp renderDiagnostic current<cr>", { desc = "Render Diagnostics (Current)", silent = true})
                        vim.keymap.set("n", ",", ":RustLsp renderDiagnostic<cr>", { desc = "Render Diagnostics (Cycle)", silent = true})


                        vim.keymap.set("n", "<leader>cr", ":RustLsp run<cr><cr>", { desc = "Run Code", silent = true})
                        vim.keymap.set("n", "<leader>cR", ":RustLsp runnables<cr>", { desc = "Runnables", silent = true})
                        vim.keymap.set("n", "<leader>ct", ":RustLsp testables<cr>", { desc = "Testables", silent = true})
                        vim.keymap.set("n", "<leader>cl", ":RustLsp! testables<cr>", { desc = "Last Test", silent = true})

                        -- vim.keymap.set("n", "<leader>dr", ":RustLsp debug<cr>", { desc = "Run Debug", silent = true})
                        -- vim.keymap.set("n", "<leader>dR", ":RustLsp debuggables<cr>", { desc = "Debuggables", silent = true})
                        -- vim.keymap.set("n", "<F12>", ":lua require('dap').step_over()<cr>", { desc = "Step Over"})
                        -- vim.keymap.set("n", "<F11>", ":lua require('dap').step_into()<cr>", { desc = "Step Into"})
                        -- vim.keymap.set("n", "<F10>", ":lua require('dap').step_out()<cr>", { desc = "Step Out"})
                        -- vim.keymap.set("n", "<leader>dl", ":lua require('dap').run_last()<cr>", { desc = "Run Last", silent = true})
                        -- vim.keymap.set("n", "<leader>dt", ":lua require('dap').terminate()<cr>", { desc = "Terminate", silent = true})
                    end,
                    default_settings = {
                        ["rust-analyzer"] = {},
                    },
                },
                -- dap = {},
            }
            -- vim.g.rustaceanvim.dap.autoload_configurations = true
            vim.g.rustaceanvim.tools.test_executor = "background"
        end,
    },

    {
        "saecki/crates.nvim",
        ft = {"toml"},
        tag = "stable",
        config = function()
            require("crates").setup({})
        end,
    },
}
