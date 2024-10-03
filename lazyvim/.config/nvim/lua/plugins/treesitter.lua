return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  opts = {
    ensure_installed = { "python", "javascript", "lua", "ruby", "hcl", "go", "terraform" },
    sync_install = false,
    auto_install = true,
    highlight = {
      additional_vim_regex_highlighting = false,
    },
    autotag = {
      enable = true,
      filetypes = { "html", "xml", "javascriptreact", "typescriptreact" },
    },
    rainbow = {
      enable = false,
      extended_mode = false,
      max_file_lines = nil,
    },
  },
}
