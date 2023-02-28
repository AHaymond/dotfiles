-- ========= nvim-tree ==========
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "X", action = "cut" },
        { key = "x", action = "close_node" },
        { key = "D", action = "cd" },
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      glyphs = {
        default = '',
        symlink = '',
      },
    },
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


-- ==============================
