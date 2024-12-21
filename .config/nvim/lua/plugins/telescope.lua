return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
        },

        config = function()
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")

            require("telescope.themes").get_ivy()
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

            vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "File" })
            vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "String" })
            vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "String under cursor" })
            vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
            vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
            vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
            vim.keymap.set("n", "<leader>fn", "<cmd>Telescope notify<CR>", { desc = "Notifications" })
            vim.keymap.set("n", "<leader>fl", function()
                require("telescope.builtin").live_grep({ search_dirs = { vim.fn.expand("%:p") } })
            end, { desc = "Local string" })
        end,
    },
}
