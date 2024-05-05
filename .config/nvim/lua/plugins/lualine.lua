return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = " " },
			},

			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filetype", "filename", "branch", "diff", "diagnostics" },
				lualine_x = { "encoding", "fileformat", "progress", "location" },
				lualine_y = {},
				lualine_z = {},
			},

			extensions = { "fugitive" },
		})
	end,
}
