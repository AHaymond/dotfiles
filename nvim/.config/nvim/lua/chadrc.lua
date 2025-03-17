-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.ui = {
  tabufline = {
    enabled = false
  },
  statusline = {
    theme = "default",           -- Options: "default", "vscode", "minimal", "vscode_colored"
    separator_style = "default", -- "default", "round", "block", "arrow"
    order = { "mode", "file_long", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      file_long = function()
        local icon = " 󰈚 "
        local name = vim.fn.expand "%:." -- This gets the relative path
        if name == "" then
          name = "[No Name]"
        else
          local devicons_present, devicons = pcall(require, "nvim-web-devicons")
          if devicons_present then
            local ft_icon = devicons.get_icon(name)
            icon = (ft_icon ~= nil and " " .. ft_icon) or icon
          end
        end
        return "%#St_file_info#" .. icon .. " " .. name .. "%#St_file_sep# "
      end,
    },
  },
}

M.base46 = {
  theme = "bearded-arc",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
