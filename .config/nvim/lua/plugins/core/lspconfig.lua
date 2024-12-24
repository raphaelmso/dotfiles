return {

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "saghen/blink.cmp" },
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            disable = { "missing-fields" },
                        }
                    },
                },
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    if client:supports_method('textDocument/formatting') then
                        -- Format the current buffer on save
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end,
                        })
                    end
                end,
            })

            local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋼" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to Definition" })
            vim.keymap.set("n", "<leader>ck", vim.lsp.buf.hover, { desc = "Hover Actions" })
            vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
            vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, { desc = "Rename" })
            vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
            vim.keymap.set("n", "<leader>ch", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
                { desc = "Toggle Inlay Hints" })


            vim.keymap.set("n", "<leader>xi", ":LspInfo<cr>", { desc = "LSP Info" })
            vim.keymap.set("n", "<leader>xm", ":Mason<cr>", { desc = "Mason" })
            vim.keymap.set("n", "<leader>xl", ":Lazy<cr>", { desc = "Lazy" })
        end,
    },
}
