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
		use "nvim-lua/plenary.nvim"
		use "shaunsingh/nord.nvim"
		use	"williamboman/mason.nvim"
	  use "williamboman/mason-lspconfig.nvim"
		use "neovim/nvim-lspconfig"
		use "hrsh7th/cmp-nvim-lsp"
		use "hrsh7th/cmp-buffer"
		use "hrsh7th/cmp-path"
		use "hrsh7th/cmp-cmdline"
		use	"hrsh7th/nvim-cmp"
		use	"L3MON4D3/LuaSnip"
		use "saadparwaiz1/cmp_luasnip"
    use "lukas-reineke/indent-blankline.nvim"
    use "stevearc/dressing.nvim"
    use "mrjones2014/legendary.nvim"
    use "glepnir/lspsaga.nvim"
    use "lewis6991/gitsigns.nvim"
    use "folke/which-key.nvim"
    use "ii14/emmylua-nvim"
    use "b0o/schemastore.nvim"
    use "numToStr/Comment.nvim"
    use {
      "nvim-neorg/neorg",
      requires = "nvim-lua/plenary.nvim",
    }
		use {
			"jose-elias-alvarez/null-ls.nvim",
			requires = "nvim-lua/plenary.nvim",
		}
		use {
			"nvim-telescope/telescope.nvim",
			requires = "nvim-lua/plenary.nvim"
		}
		use {
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make"
		}
		use {
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		}
    use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate"
		}
	end
})
