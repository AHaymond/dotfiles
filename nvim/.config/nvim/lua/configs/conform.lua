local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    ruby = { "prettierd" },
    go = { "goimports", "gofumpt" },
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },
    ["_"] = { "trim_whitespace" },
  },
  -- Set up format-on-save
  format_on_save = {
    async = false,
    timeout_ms = 15000,
    lsp_fallback = true,
    stop_after_first = true
  },

  default_format_opts = {
    async = false,
    quiet = false,
    timeout_ms = 3000,
    lsp_format = "fallback"
  },
  -- Customize formatters
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
    goimports = {
      command = "goimports",
      -- Simplified args since Conform handles the filename
      -- args = function()
      --   return { "-w", "$FILENAME" }
      -- end,
      stdin = false,
    },
    notify_on_error = true,
  },
}

require("conform").setup(options)
