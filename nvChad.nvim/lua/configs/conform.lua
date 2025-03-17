local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "gofumpt" },
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- Set up format-on-save
  format_on_save = { async = false, timeout_ms = 3000, lsp_fallback = true },
  default_format_opts = { async = false, quiet = false, timeout_ms = 3000, lsp_format = "fallback" },
  -- Customize formatters
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
