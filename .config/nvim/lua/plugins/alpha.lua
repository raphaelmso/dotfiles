return {
	"goolord/alpha-nvim",
	event = "vimenter",
	dependencies = { "rchrdariza/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local v = vim.version()
		local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

		-- set header
		dashboard.section.header.val = {
			[[                                                  ]],
			[[                                                  ]],
			[[                                                  ]],
			[[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
			[[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
			[[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
			[[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
			[[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
			[[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
			[[                                                  ]],
			[[                                                  ]],
			[[                                                  ]],
		}

		-- set the button list
		dashboard.section.buttons.val = {
			dashboard.button("n", "   New file", ":Oil<cr>"),
			dashboard.button("f", "󰮗   Find file", ":Telescope find_files<cr>"),
			dashboard.button("s", "󱘞   Find text", ":Telescope live_grep<cr>"),
			dashboard.button("r", "   Recent", ":Telescope oldfiles<cr>"),
			dashboard.button("q", "󰗼   Quit", ":qa<cr>"),
		}

		function centertext(text, width)
			local totalpadding = width - #text
			local leftpadding = math.floor(totalpadding / 2)
			local rightpadding = totalpadding - leftpadding
			return string.rep(" ", leftpadding) .. text .. string.rep(" ", rightpadding)
		end

		-- define a highlight group for buttons
		vim.api.nvim_set_hl(0, "alphabutton", { fg = "#bb9af7", bold = true }) -- customize this to your preferred color

		-- set the button colors by applying the highlight group
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "alphabutton" -- apply custom highlight group to each button
		end

		-- send config to alpha
		--
		alpha.setup(dashboard.opts)
		-- disable folding on alpha buffer
		vim.cmd([[autocmd filetype alpha setlocal nofoldenable]])
	end,
}
