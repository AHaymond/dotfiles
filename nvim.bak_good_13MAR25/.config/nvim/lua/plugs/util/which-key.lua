vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")

local mappings = {
    { "<leader>f", group = "Telescope" },
    { "<leader>ff", ":Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", ":Telescope oldfiles<cr>", desc = "Recently Opened" },
    { "<leader>fr", ":Telescope live_grep<cr>", desc = "Find String" },
    { "<leader>q", group = "File" },
    { "<leader>qq", ":q<cr>", desc = "Quit" },
    { "<leader>qs", ":w<cr>", desc = "Save" },
    { "<leader>qw", ":wq<cr>", desc = "Save & Quit" },
    { "<leader>qx", ":bdelete<cr>", desc = "Close" },
  }
wk.add(mappings)
