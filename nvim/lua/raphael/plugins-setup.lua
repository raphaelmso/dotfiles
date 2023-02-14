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
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim") -- luca functions that many plugins use

	use("folke/tokyonight.nvim") -- Tokyo Night theme

	use("christoomey/vim-tmux-navigator") -- Tmux navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	use("tpope/vim-surround") -- surround lines/words with motions <READ DOCS>

	use("vim-scripts/ReplaceWithRegister") -- <READ DOCS>

	use("numToStr/Comment.nvim") -- Makes comment moves easier

	use("nvim-tree/nvim-tree.lua") -- file explorer

	use("kyazdani42/nvim-web-devicons") -- icons

	use("nvim-lualine/lualine.nvim") -- statusLine

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use("nvim-telescope/telescope.nvim") -- fuzzy finder

	use("hrsh7th/nvim-cmp") -- Autocompletion
	use("hrsh7th/cmp-buffer") -- Addon
	use("hrsh7th/cmp-path") -- Addon

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- managing and installing lsp servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")

	-- formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git signs plugin
	use("lewis6991/gitsigns.nvim")

	use("ThePrimeagen/vim-be-good") -- Vim training

	if packer_bootstrap then
		require("packer").sync()
	end
end)
