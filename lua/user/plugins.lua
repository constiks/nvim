local fn = vim.fn

-- Automatically install packer
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim", commit = "64ae65fea395d8dc461e3884688f340dd43950ba" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "9fa996123031b4cad100bd5afad04384a622c8a7" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = "5f01c1a89adafc52bf34e3bf690f80d9d726715d" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" }
  use { "kyazdani42/nvim-web-devicons", commit = "05e1072f63f6c194ac6e867b567e6b437d3d4622" }
  use { "kyazdani42/nvim-tree.lua", commit = "3c5d9dd31f52a56dd78a7a1c3c8d411fe7fa1116" } 
  use { "akinsho/bufferline.nvim", commit = "4ecfa81e470a589e74adcde3d5bb1727dd407363" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "bfa0d99ba6f98d077dd91779841f1c88b7b5c165" }
  use { "akinsho/toggleterm.nvim", commit = "b02a1674bd0010d7982b056fd3df4f717ff8a57a" }
  use { "ahmedkhalf/project.nvim", commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4" }
  use { "lewis6991/impatient.nvim", commit = "d3dd30ff0b811756e735eb9020609fa315bfbbcc" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "c4c203c3e8a595bc333abaf168fcb10c13ed5fb7" }
  use { "goolord/alpha-nvim", commit = "21a0f2520ad3a7c32c0822f943368dc063a569fb" }
  use { "folke/which-key.nvim", commit = "61553aeb3d5ca8c11eea8be6eadf478062982ac9" }

  -- Colorschemes
  -- use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
  -- use { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" }
  use { "ishan9299/nvim-solarized-lua", commit = "7bd46fa036bde6b4483fb7403b0a7b0754faeeaa" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "93f385c17611039f3cc35e1399f1c0a8cf82f1fb" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "da522e90ebc87500b94bc1db6f96d7def266f50b" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "9b3e497cf0c3abcf73d791968a9768a22405fa13" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig", commit = "3bb0c53b1df74d4b3b70d5939a015b19064a5a06" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "01464927921c97d4e5ddbd985c6d27b29b927c17"}
  use { "williamboman/mason-lspconfig.nvim", commit = "e8bd50153b94cc5bbfe3f59fc10ec7c4902dd526" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "a0acd495f5edce6d4d5d3c6bd63d2319ccded9ed" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3" }

  -- Java
  use { "mfussenegger/nvim-jdtls", commit = "e0147c1b0f94708392783bbb44db8cd8bf8c84d4" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim", commit = "cabf991b1d3996fa6f3232327fc649bbdf676496" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", commit = "619f1ace03860d668c7a661332c38480f2db2584" }

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "d076301a634198e0ae3efee3b298fc63c055a871" }

  -- DAP
  use { "mfussenegger/nvim-dap", commit = "a8fd28aec46fe9f5dd42f8d5939217ce60787d73" }
  use { "rcarriga/nvim-dap-ui", commit = "54365d2eb4cb9cfab0371306c6a76c913c5a67e3" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
