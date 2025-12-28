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
  use { "nvim-lua/plenary.nvim", commit = "857c5ac632080dba10aae49dba902ce3abf91b35" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "23320e75953ac82e559c610bec5a90d9c6dfa743" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "1b212c2eee76d787bbea6aa5e92a2b534e7b4f8f" }
  use { "nvim-tree/nvim-web-devicons", commit = "8dcb311b0c92d460fac00eac706abd43d94d68af" }
  use { "nvim-tree/nvim-tree.lua", commit = "eb33612bff2fb31f54946fb5dcadc89e905e81ec" }
  use { "akinsho/bufferline.nvim", commit = "655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "a94fc68960665e54408fe37dcf573193c4ce82c9" }
  use { "akinsho/toggleterm.nvim", commit = "9a88eae817ef395952e08650b3283726786fb5fb" }
  use { "ahmedkhalf/project.nvim", commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "005b56001b2cb30bfa61b7986bc50657816ba4ba" }
  use { "folke/which-key.nvim", commit = "370ec46f710e058c9c1646273e6b225acf47cbed" }

  -- Colorschemes
  -- use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
  -- use { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" }
  use { "ishan9299/nvim-solarized-lua", commit = "d69a263c97cbc765ca442d682b3283aefd61d4ac" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "b5311ab3ed9c846b585c0c15b7559be131ec4be9" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "b74fab3656eea9de20a9b8116afa3cfc4ec09657" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "e52e640b7befd8113b3350f46e8cfcfe98fcf730" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "a8912b88ce488f411177fc8aed358b04dc246d7b" }
  use { "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" }

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "831a130291eb6dae0dabd2748d0a99401a2eebc4" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "572f5660cf05f8cd8834e096d7b4c921ba18e175" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig", commit = "f47cd681d7cb6048876a2e908b6d8ba1e530d152" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "8024d64e1330b86044fed4c8494ef3dcd483a67c"}
  use { "williamboman/mason-lspconfig.nvim", commit = "bb3a17efc797c34c054463174e5522442576ebd8" }
  use { "nvimtools/none-ls.nvim", commit = "a5954f00ee88bcdf154e931198ec636a26a1077c" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "0d1e93684da00ab7c057410fecfc24f434698898" }

  -- Java
  use { "mfussenegger/nvim-jdtls", commit = "4d77ff02063cf88963d5cf10683ab1fd15d072de" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim", commit = "b4da76be54691e854d3e0e02c36b0245f945c2c7" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", commit = "36fcb4a4238928f0b627e1ab84ade0acc1facc2c" }

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "0cb5a7753d3c4b8e9cfdc9d88d9110cb8d4b1544" }

  -- DAP
  use { "mfussenegger/nvim-dap", commit = "5dd4d50f2e6a2eaf9e57fad023d294ef371bda35" }
  use { "rcarriga/nvim-dap-ui", commit = "cf91d5e2d07c72903d052f5207511bf7ecdb7122" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

    -- Github copilot
  use { "github/copilot.vim" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
