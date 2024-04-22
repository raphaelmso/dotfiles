return {
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
		config = function()
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			vim.g.rustaceanvim = {
				tools = {
					hover_actions = {
						auto_focus = true,
					},
				},
				server = {
					on_attach = function(client, bufnr)
						vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
						vim.keymap.set("n", "K", ":RustLsp hover actions<cr>")
						vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
						vim.keymap.set("n", "<leader>ca", ":RustLsp codeAction<cr>")

						if client.supports_method("textDocument/formatting") then
							vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
							vim.api.nvim_create_autocmd("BufWritePre", {
								group = augroup,
								buffer = bufnr,
								callback = function()
									vim.lsp.buf.format()
								end,
							})
						end

						vim.keymap.set(
							"n",
							"<leader>dB",
							":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>"
						)
						vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<cr>")
						vim.keymap.set("n", "<F1>", ":RustLsp run<cr><cr>")
						vim.keymap.set("n", "<F2>", ":RustLsp runnables<cr>")
						vim.keymap.set("n", "<F5>", ":RustLsp debug<cr>")
						vim.keymap.set("n", "<F6>", ":RustLsp debuggables<cr>")
						vim.keymap.set("n", "<F10>", ":lua require('dap').step_over()<cr>")
						vim.keymap.set("n", "<F11>", ":lua require('dap').step_into()<cr>")
						vim.keymap.set("n", "<F12>", ":lua require('dap').step_out()<cr>")
						vim.keymap.set("n", "<leader>dl", ":lua require('dap').run_last()<cr>")
						vim.keymap.set("n", "<leader>de", ":lua require('dap').terminate()<cr>")
					end,
					default_settings = {
						-- rust-analyzer language server configuration
						["rust-analyzer"] = {},
					},
					-- ...
				},
				dap = {
					-- ...
				},
			}
			vim.g.rustaceanvim.dap.autoload_configurations = true
		end,
	},

	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},
}
