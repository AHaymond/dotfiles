return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = function()
      return require "configs.mason"
    end,
  },
}
