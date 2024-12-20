return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps",
		},
	},
	opts = {
		icons = {
			mappings = false,
		},
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500

		vim.keymap.set("n", "<leader>f", "", { desc = "Find" })
		vim.keymap.set("n", "<leader>s", "", { desc = "Split" })
		vim.keymap.set("n", "<leader>z", "", { desc = "Surround" })
		vim.keymap.set("n", "<leader>c", "", { desc = "Code" })
		vim.keymap.set("n", "<leader>l", "", { desc = "LSP" })
		vim.keymap.set("n", "<leader>d", "", { desc = "Debug" })
	end,
}