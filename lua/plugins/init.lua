local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

local ok, packer = pcall(require,"packer")
if not ok then
	return
end
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
packer.startup({
	function(use)
		use "wbthomason/packer.nvim"
		use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
		}
		use "nvim-lua/plenary.nvim"
		use "shaunsingh/nord.nvim"
		use {
			"williamboman/mason.nvim",
			config = function() require("configs.mason") end
		}
		use "williamboman/mason-lspconfig.nvim"
		use "neovim/nvim-lspconfig"
		use "hrsh7th/cmp-nvim-lsp"
		use "hrsh7th/cmp-buffer"
		use "hrsh7th/cmp-path"
		use "hrsh7th/cmp-cmdline"
		use {
			"hrsh7th/nvim-cmp",
			config = function() require("configs.cmp") end
		}
		use {
			"L3MON4D3/LuaSnip",
			config = function() require("configs.luasnip") end
		}
		use "saadparwaiz1/cmp_luasnip"
		use {
			"jose-elias-alvarez/null-ls.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function() require("configs.null-ls") end
		}
		use {
			"nvim-telescope/telescope.nvim",
			requires = "nvim-lua/plenary.nvim"
		}
		use {
			'nvim-telescope/telescope-fzf-native.nvim',
			run = 'make'
		}
		use {
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		}
	end
})
