local M = {}

-- Override plugin settings
M.plugins = {
  override = {
    ["lukas-reineke/indent-blankline.nvim"] = {
      show_current_context = false, -- Optional: tweak settings if you want partial disable
      enabled = false
    }
  }
}

return M
