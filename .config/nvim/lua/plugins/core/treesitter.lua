return {
	"nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "lua", "rust", "vimdoc", "luadoc", "markdown" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
