return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "node_modules" },
					mappings = {
						i = {
							["<A-k>"] = actions.move_selection_previous,
							["<A-j>"] = actions.move_selection_next,
							["<A-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
						},
					},
				},
			})

			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
			vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
			vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
			vim.keymap.set("n", "<leader>fo", "<cmd>Telescope buffers<cr>")
			vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
			vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>")
		end,
	},
}
