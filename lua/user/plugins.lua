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
  use { "wbthomason/packer.nvim", commit = "ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "a56bf0071bf63d35274fdc4738bb1e8821cfd2ea" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "defad64afbf19381fe31488a7582bbac421d6e38" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = "0236521ea582747b58869cb72f70ccfa967d2e89" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "9bff161dfece6ecf3459e6e46ca42e49f9ed939f" }
  use { "kyazdani42/nvim-web-devicons", commit = "ecdeb4e2a4af34fc873bbfbf1f4c4e447e632255" }
  use { "kyazdani42/nvim-tree.lua", commit = "b7f6600bc2b4e48e4af45f1e77d2bf170685a542" }
  use { "akinsho/bufferline.nvim", commit = "9961d87bb3ec008213c46ba14b3f384a5f520eb5" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63" }
  use { "akinsho/toggleterm.nvim", commit = "b02a1674bd0010d7982b056fd3df4f717ff8a57a" }
  use { "ahmedkhalf/project.nvim", commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "9637670896b68805430e2f72cf5d16be5b97a22a" }
  use { "folke/which-key.nvim", commit = "7ccf476ebe0445a741b64e36c78a682c1c6118b7" }

  -- Colorschemes
  -- use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
  -- use { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" }
  use { "ishan9299/nvim-solarized-lua", commit = "7bd46fa036bde6b4483fb7403b0a7b0754faeeaa" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "5dce1b778b85c717f6614e3f4da45e9f19f54435" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "44b16d11215dce86f253ce0c30949813c0a90765" }
  use { "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" }

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "ea7d7ea510c641c4f15042becd27f35b3e5b3c2b" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "ebf6d6e83494cdd88a54a429340256f4dbb6a052" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig", commit = "d177ad277a638f262edb73c75ffe33e377b95dc5" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "ee6a7f179ebf8aa9da9d53b1cf1b57d292ea0182"}
  use { "williamboman/mason-lspconfig.nvim", commit = "dfdd771b792fbb4bad8e057d72558255695aa1a7" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "76f28e858f1caae87bfa45fb4fd09e4b053fc45b" }

  -- Java
  use { "mfussenegger/nvim-jdtls", commit = "095dc490f362adc85be66dc14bd9665ddd94413b" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim", commit = "18f10f28007cb8b4d50324217349c3f568684be2" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", commit = "c13e28f8947a9200e816038d85cb1302be11f8e6" }

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "fef5d90953f0a730483b44745fae5938ba8227f8" }

  -- DAP
  use { "mfussenegger/nvim-dap", commit = "0e6b7c47dd70e80793ed39271b2aa712d9366dbc" }
  use { "rcarriga/nvim-dap-ui", commit = "85b16ac2309d85c88577cd8ee1733ce52be8227e" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
