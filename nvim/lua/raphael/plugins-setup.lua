local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- Tokyo Night theme
	use("folke/tokyonight.nvim")

	-- Tmux navigation
	use("christoomey/vim-tmux-navigator")

	-- Maximizes and restores current window
	use("szw/vim-maximizer")

	-- Surround lines/words with motions <READ DOCS>
	use("tpope/vim-surround")

	-- Replace with register
	use("vim-scripts/ReplaceWithRegister") -- <READ DOCS>

	-- Makes comment moves easier
	use("numToStr/Comment.nvim")

	-- File explorer
	use("nvim-tree/nvim-tree.lua")

	-- Icons like VSCode
	use("kyazdani42/nvim-web-devicons")

	-- StatusLine
	use("nvim-lualine/lualine.nvim")

	-- Telescope and its dependency for better sorting performance
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope.nvim")

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Managing and installing lsp servers
	use("williamboman/mason.nvim") -- Easily manage external editor tooling like LSP Servers, linters and formatters
	use("williamboman/mason-lspconfig.nvim") -- Closes some gaps that exist between mason.nvim and lspconfig

	-- Configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp") -- Makes possible to configure LSP server to appear in autocompletion
	use({
		"glepnir/lspsaga.nvim", -- Enhanced UI to LSP
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- Enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim") -- Add VSCode icons to autocompletion

	-- Formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- Treesitter configuration | Highlights
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- Git signs plugin
	use("lewis6991/gitsigns.nvim")

	-- Vim training
	use("ThePrimeagen/vim-be-good")

	-- Colorizer - Show colors in code
	use("NvChad/nvim-colorizer.lua")

	-- Markdown Preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Floating Terminal
	use("voldikss/vim-floaterm")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
