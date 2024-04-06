return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "folke/neodev.nvim", "nvim-neotest/nvim-nio" },

	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup()

		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle()<cr>")
		vim.keymap.set("n", "<leader>de", ":lua require('dapui').eval()<cr>")
		vim.keymap.set("n", "<leader>dr", ":lua for i=1,5 do require('dapui').open({reset = true}) end<cr>")
	end,
}
