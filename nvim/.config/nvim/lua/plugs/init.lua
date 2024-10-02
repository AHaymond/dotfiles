-- disable netrw see :help nvim-tree-netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("plugs.strap")
local lazy = require("lazy")
lazy.setup({
  concurrency = 4,
  {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    event = "VeryLazy",
    config = function() require('plugs.ts.treesitter') end
  },
  {
    'kyazdani42/nvim-tree.lua',
    event = "VeryLazy",
    cmd = "NvimTreeToggle",
    lazy = true,
    config = function() require('plugs.util.nvim-tree') end
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    config = function() require('plugs.util.lualine')end
  },
  {
    "kyazdani42/nvim-web-devicons",
    event = "VeryLazy",
    config = function() require('plugs.ui.devicons') end,
    lazy = true,
  },
  {
    'nvim-lua/plenary.nvim',
    event = "VeryLazy",
  },
  {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    dependencies = {'plenary.nvim'},

    config = function() require('plugs.util.telescope')end
  },
--  {
--    event = "VeryLazy",
--    "folke/which-key.nvim",
--    config = function() require('plugs.util.which-key')end
--  },
  {
    "hashivim/vim-terraform",
    lazy = false
  },
  {
    "dense-analysis/ale",
    init = function() require('plugs.util.ale')end
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy"
  },
  -- Colorscheme
  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function() require('plugs.ui.colorscheme') end
  },
})
