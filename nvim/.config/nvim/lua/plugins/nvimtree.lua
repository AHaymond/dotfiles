return {
  {
    'kyazdani42/nvim-tree.lua',
    event = "VeryLazy",
    cmd = "NvimTreeToggle",
    lazy = true,
    config = function() require('configs.nvim-tree') end,
  },
}
