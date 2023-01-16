local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	--lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	use("navarasu/onedark.nvim")  --preferred colorscheme

	--tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	use("szw/vim-maximizer")  --maximizes and restores current window

	--essential plugins
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	--commenting with gc
	use("numToStr/Comment.nvim")

	--file explorer
	use("nvim-tree/nvim-tree.lua")

	--nvim tree icons
	use("kyazdani42/nvim-web-devicons")

	--statusline
	use("nvim-lualine/lualine.nvim")

	--fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	--autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	--snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	--managing & installing lsp servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	--configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ 
		"glepnir/lspsaga.nvim", 
		branch = "main",
		config = function()
			require('lspsaga').setup({})
		end,
	})
	use("onsails/lspkind.nvim")

	--formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	--treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	--auto closing
	use("windwp/nvim-autopairs")
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	--git signs plugin
	use("lewis6991/gitsigns.nvim")

	--which-key plugin
	use({
		"folke/which-key.nvim",
		config =  function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	})

	--parenthesis highlight
	use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })

	 -- Context based commenting
	use({ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" })

	--color highlighter
	use("norcalli/nvim-colorizer.lua")

	--smooth escaping
	use({
		"max397574/better-escape.nvim",
		config = function()
		  require("better_escape").setup()
		end,
	})

	--indentation guider
	use("lukas-reineke/indent-blankline.nvim")

	--indent detecter
	use("Darazaki/indent-o-matic")

	--smart splits of windows
	use("mrjones2014/smart-splits.nvim")

	--todo comments
	use({ 
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end
	})

	--noice plugin
	use("MunifTanjim/nui.nvim")
	use({
		"folke/noice.nvim",
		config = function()
			require("noice").setup({})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
		}
	})

	--dashboard plugin
	use("glepnir/dashboard-nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
