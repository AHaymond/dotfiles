require("plugs.strap")
local lazy = require("lazy")

lazy.setup({
  {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    event = "VeryLazy",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
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
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    config = function() require('plugs.util.lualine')end
  },
  {
    "folke/which-key.nvim",
    config = function() require('plugs.util.which-key')end
  },

  -- All the color schemes, set in .config/nvim/lua/core/cfg.lua
  {
    'folke/tokyonight.nvim',
    event = "VeryLazy",
  --  config = function() require('plugs.ui.colorscheme')end
  },
  {
    'ellisonleao/gruvbox.nvim', -- inlcude this for dark >> vim.o.background = "dark"
    event = "VeryLazy",
    --config = function() require('plugs.ui.colorscheme')end
  },
  {
    'EdenEast/nightfox.nvim',
   -- event = "VeryLazy",
   -- config = function() require('plugs.ui.colorscheme')end
  },
  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function() require('plugs.ui.colorscheme')end
  }
})
