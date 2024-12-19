return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- local capabilities = require("blink.cmp").default_capabilities()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋼" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
			vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to Definition" })
			vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, {desc = "Hover Actions"})
			vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {desc = "Code Actions"})
			vim.keymap.set("n", ",", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", {desc = "Toggle Inlay Hints"})
		end,
	},
}
