return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        local fzf = require("fzf-lua")
        fzf.setup({
            fzf_opts = {
                ['--layout'] = 'reverse',
            },
        })

        vim.keymap.set("n", "<leader>f", fzf.files, { desc = "File" })
        vim.keymap.set("n", "<leader>r", fzf.live_grep, { desc = "String" })
        vim.keymap.set("n", "<leader>o", fzf.buffers, { desc = "Buffers" })
        vim.keymap.set("n", "<leader>Fs", fzf.grep_cWORD, { desc = "String under cursor" })
        vim.keymap.set("n", "<leader>Fx", fzf.builtin, { desc = "Builtin" })
        vim.keymap.set("n", "<leader>Fh", fzf.helptags, { desc = "Help" })
        vim.keymap.set("n", "<leader>Fk", fzf.keymaps, { desc = "Keymaps" })
        vim.keymap.set("n", "<leader>Fq", fzf.quickfix, { desc = "Quickfix" })
        vim.keymap.set("n", "<leader>FQ", fzf.quickfix_stack, { desc = "Quickfix Stack" })
        vim.keymap.set("n", "<leader>Fl", fzf.grep_curbuf, { desc = "Local string" })
        vim.keymap.set("n", "<leader>Fo", fzf.oldfiles, { desc = "Old Files" })
        vim.keymap.set("n", "<leader>Fd", fzf.lsp_definitions, { desc = "Definitions" })
        vim.keymap.set("n", "<leader>FD", fzf.lsp_declarations, { desc = "Declarations" })
        vim.keymap.set("n", "<leader>Ft", fzf.lsp_typedefs, { desc = "Type Definitions" })
        vim.keymap.set("n", "<leader>Fi", fzf.lsp_implementations, { desc = "Implementations" })
        vim.keymap.set("n", "<leader>Fa", fzf.lsp_finder, { desc = "All LSP locations" })
        vim.keymap.set("n", "<leader>Fr", fzf.lsp_references, { desc = "All LSP locations" })

        vim.keymap.set("n", "<leader>Fc", ":TodoFzfLua<CR>", {desc = "ToDo Comments"})

    end,

}
