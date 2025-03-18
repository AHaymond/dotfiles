return {
  {
    'nvim-telescope/telescope.nvim',
    branch = "0.1.x",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function() require('configs.telescope') end,
  },
}
