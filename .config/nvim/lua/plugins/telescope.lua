return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
            { 'nvim-tree/nvim-web-devicons' },
        },

        config = function()
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")

            require('telescope').load_extension('fzf')
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = { "node_modules" },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files theme=ivy<cr>", { desc = "File" })
            vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep theme=ivy<cr>", { desc = "String" })
            vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string theme=ivy<cr>",
                { desc = "String under cursor" })
            vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers theme=ivy<cr>", { desc = "Buffers" })
            vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags theme=ivy<cr>", { desc = "Help" })
            vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps theme=ivy<CR>", { desc = "Keymaps" })
            vim.keymap.set("n", "<leader>fn", "<cmd>Telescope notify theme=ivy<CR>", { desc = "Notifications" })
            vim.keymap.set("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>",
                { desc = "Local string" })
            vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles theme=ivy<CR>", { desc = "Keymaps" })
        end,
    },
}
