require("plugs.strap")
local lazy = require("lazy")

lazy.setup({
  {
    'kyazdani42/nvim-tree.lua',
    event = "VeryLazy",
    cmd = "NvimTreeToggle",
    lazy = true,
    config = function() require('plugs.util.nvim-tree') end
  },
  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function() require('plugs.ui.colorscheme')end
  }
})
