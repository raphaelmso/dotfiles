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
					mappings = {
						i = {
							["<A-k>"] = actions.move_selection_previous,
							["<A-j>"] = actions.move_selection_next,
							["<A-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
						},
					},
				},
			})

			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
			vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find files within current working directory, respects .gitignore
			vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
			vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
			vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
			vim.keymap.set("n", "<leader>km", "<cmd>Telescope keymaps<CR>") -- list keymaps
			vim.keymap.set("n", "<leader>e", "<cmd>Telescope file_browser<CR>") -- file browser

			require("telescope").load_extension("file_browser")
		end,
	},

	{ "nvim-telescope/telescope-file-browser.nvim" },
}
