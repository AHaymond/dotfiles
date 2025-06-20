require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
--
-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- vim.g.mapleader = ','
--local map = vim.api.nvim_set_keymap

vim.api.nvim_exec2([[
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
]], { output = false })

-- Insert one character using s, S without having to enter/exit edit mode
map('n', 's', ':<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>', { noremap = true, silent = true })
map('n', 'S', ':<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>', { noremap = true, silent = true })

-- Turn off line numbers, close nvim-tree, and git signs to enable mouse highlighting and copying
map('n', '<leader>gs', '<cmd>Gitsigns toggle_signs<CR><cmd>IBLToggle<CR><cmd>set number!<CR><cmd>NvimTreeToggle<CR>',
  { noremap = true, silent = true })

--map('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- allow moving lines up and down using ctrl-j and ctrl-k
-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', ':m .+1<CR>==', { noremap = true, silent = true })
map('n', '<C-k>', ':m .-2<CR>==', { noremap = true, silent = true })
map('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- re-highlight selected text after tab in visual mode
map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- So we can use the arrow keys but still act like regular vim
-- The imap turn off the arrow keys when in insert mode
map('i', '<up>', '<nop>', {})
map('i', '<down>', '<nop>', {})
map('i', '<left>', '<nop>', {})
map('i', '<right>', '<nop>', {})
map('n', '<up>', 'gk', {})
map('n', '<down>', 'gj', {})
map('n', '<left>', 'h', {})
map('n', '<right>', 'l', {})
map('v', '<up>', 'gk', {})
map('v', '<down>', 'gj', {})
map('v', '<left>', 'h', {})
map('v', '<right>', 'l', {})

map('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true })

-- move to next/previous diagnostic (aka error)
map("n", "]g", ":lua vim.diagnostic.goto_next()<CR>")
map("n", "[g", ":lua vim.diagnostic.goto_prev()<CR>")

map('n', '<leader>da', function()
  vim.diagnostic.open_float({
    scope = "line",
    border = "rounded",
    width = 80,
    wrap = true,
  })
end, { desc = "Show diagnostics window with fixed width" })
