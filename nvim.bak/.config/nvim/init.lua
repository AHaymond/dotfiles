vim.g.mapleader = ','
local map = vim.api.nvim_set_keymap
map('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
require("core")
require("plugs")
