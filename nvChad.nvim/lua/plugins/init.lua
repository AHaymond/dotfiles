return {
 {
    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufNewFile" },
    cmd = { "ConformInfo" },
    config = function()
      require "configs.conform"
    end,
  },
  {
    'kyazdani42/nvim-tree.lua',
    event = "VeryLazy",
    cmd = "NvimTreeToggle",
    lazy = true,
    config = function() require('plugins.util.nvim-tree') end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
--  {
--    "williamboman/mason.nvim",
--    opts = function()
--      return require "configs.mason"
--    end,
--  },
--  {
--    'nvim-telescope/telescope.nvim',
--    event = "VeryLazy",
--    dependencies = {'plenary.nvim'},
--
--    config = function() require('configs.telescope')end
--  },
--  {
--    'nvim-treesitter/nvim-treesitter',
--    run = ":TSUpdate",
--    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
--    event = "VeryLazy",
--    config = function() require('configs.treesitter') end
--  },
--  {
--    "kyazdani42/nvim-web-devicons",
--    event = "VeryLazy",
--    config = function() require('configs.devicons') end,
--    lazy = true,
--  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
