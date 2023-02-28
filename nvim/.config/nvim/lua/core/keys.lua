vim.g.mapleader = ','
local map = vim.api.nvim_set_keymap

vim.api.nvim_exec([[
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
]], false)

-- Insert one character using s, S without having to enter/exit edit mode
map('n', 's', ':<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>', { noremap = true, silent = true })
map('n', 'S', ':<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>', { noremap = true, silent = true })

map('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- allow moving lines up and down using ctrl-j and ctrl-k
map('n', '<C-j>', ':m .+1<CR>==', { noremap = true, silent })
map('n', '<C-k>', ':m .-2<CR>==', { noremap = true, silent })
