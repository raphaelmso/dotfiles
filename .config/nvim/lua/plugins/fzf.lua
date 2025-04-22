return {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        local fzf = require("fzf-lua")

        fzf.setup({
            fzf_opts = {
                ['--layout'] = 'reverse',
            },
        })

        vim.keymap.set("n", "<leader>o", fzf.files, { desc = "File" })
        vim.keymap.set("n", "<leader>b", fzf.buffers, { desc = "Buffers" })
        vim.keymap.set("n", "<leader>fs", fzf.live_grep, { desc = "String" })
        vim.keymap.set("n", "<leader>fS", fzf.grep_cWORD, { desc = "Word under cursor" })
        vim.keymap.set("n", "<leader>fx", fzf.builtin, { desc = "Builtin" })
        vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Help" })
        vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Keymaps" })
        vim.keymap.set("n", "<leader>fq", fzf.quickfix, { desc = "Quickfix" })
        vim.keymap.set("n", "<leader>fQ", fzf.quickfix_stack, { desc = "Quickfix Stack" })
        vim.keymap.set("n", "<leader>fl", fzf.grep_curbuf, { desc = "Local string" })
        vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { desc = "Old Files" })
        vim.keymap.set("n", "<leader>fd", fzf.lsp_definitions, { desc = "Definitions" })
        vim.keymap.set("n", "<leader>fD", fzf.lsp_declarations, { desc = "Declarations" })
        vim.keymap.set("n", "<leader>ft", fzf.lsp_typedefs, { desc = "Type Definitions" })
        vim.keymap.set("n", "<leader>fi", fzf.lsp_implementations, { desc = "Implementations" })
        vim.keymap.set("n", "<leader>fa", fzf.lsp_finder, { desc = "All LSP locations" })
        vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document, { desc = "Diagnostics Document" })
        vim.keymap.set("n", "<leader>fw", fzf.diagnostics_workspace, { desc = "Diagnostics Workspace" })

        vim.keymap.set("n", "<leader>gff", fzf.git_files, { desc = "Files" })
        vim.keymap.set("n", "<leader>gfs", fzf.git_status, { desc = "Status" })
        vim.keymap.set("n", "<leader>gfp", fzf.git_commits, { desc = "Commits Log (Project)" })
        vim.keymap.set("n", "<leader>gfl", fzf.git_bcommits, { desc = "Commit Log (Buffer)" })
        vim.keymap.set("n", "<leader>gfr", fzf.git_branches, { desc = "Branches" })
        vim.keymap.set("n", "<leader>gft", fzf.git_tags, { desc = "Tags" })
        vim.keymap.set("n", "<leader>gfS", fzf.git_stash, { desc = "Stash" })
    end,

}
