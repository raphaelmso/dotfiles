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

		local current_element = "code_win"

		local function jump_to_element(element)
			local visible_wins = vim.api.nvim_tabpage_list_wins(0)
			local dap_configurations = require("dap").configurations
			for _, win in ipairs(visible_wins) do
				local buf = vim.api.nvim_win_get_buf(win)
				if
					vim.bo[buf].filetype == element
					or element == "code_win" and dap_configurations[vim.bo[buf].filetype] ~= nil
				then
					vim.api.nvim_set_current_win(win)
					return
				end
			end
			vim.notify(("element '%s' not found"):format(element), vim.log.levels.WARN)
		end

		local function toggle_jump()
			if current_element == "dapui_console" then
				jump_to_element("code_win")
				current_element = "code_win"
			else
				jump_to_element("dapui_console")
				current_element = "dapui_console"
			end
		end

		vim.keymap.set("n", "ç", toggle_jump, {desc = "Jump Code / Console"})
		vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle()<cr>", {desc = "Toggle UI"})
		vim.keymap.set("n", "<leader>de", ":lua require('dapui').eval()<cr>", {desc = "Evaluate Expression"})
		vim.keymap.set("n", "<leader>dU", ":lua for i=1,5 do require('dapui').open({reset = true}) end<cr>", {desc = "Reset UI"})
	end,
}
