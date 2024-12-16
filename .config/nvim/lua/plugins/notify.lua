return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			render = "compact",
			stages = "static",
			border = "none",
			on_open = function(win)
				local config = vim.api.nvim_win_get_config(win)
				config.border = "none"
				vim.api.nvim_win_set_config(win, config)
			end,
		})
		vim.notify = notify
	end,

}
