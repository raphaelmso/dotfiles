return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			-- dap.adapters.codelldb = {
			-- 	type = "server",
			-- 	port = "2001",
			-- 	executable = {
			-- 		command = "/home/raphael/.local/share/nvim/mason/bin/codelldb",
			-- 		args = { "--port", "2001" },
			-- 	},
			-- }
			--
			-- dap.configurations.rust = {
			-- 	{
			-- 		name = "Launch file",
			-- 		type = "codelldb",
			-- 		request = "launch",
			-- 		program = function()
			-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			-- 		end,
			-- 		cwd = "${workspaceFolder}",
			-- 		stopOnEntry = false,
			-- 	},
			-- }

			vim.keymap.set(
				"n",
				"<leader>dB",
				":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>"
			)
			vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<cr>")
			vim.keymap.set("n", "<F5>", ":lua require('dap').continue()<cr>")
			vim.keymap.set("n", "<F10>", ":lua require('dap').step_over()<cr>")
			vim.keymap.set("n", "<F11>", ":lua require('dap').step_into()<cr>")
			vim.keymap.set("n", "<F12>", ":lua require('dap').step_out()<cr>")
			vim.keymap.set("n", "<leader>dl", ":lua require('dap').run_last()<cr>")
			vim.keymap.set("n", "<leader>dl", ":lua require('dap').run_last()<cr>")
		end,
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
}
