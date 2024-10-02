return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  event = "VeryLazy",
}
