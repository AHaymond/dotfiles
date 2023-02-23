"GUI Options
if has("gui_running")
  set guioptions=egmrt

  "Move a line of text using (on Mac)
  "http://vimbits.com/bits/283
  nmap <D-j> mz:m+<cr>`z
  nmap <D-k> mz:m-2<cr>`z
  vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
  vmap <D-k> :m'<-2<cr>`my`<mzgv`yo`z
endif

" Open NerdTree when vim (aka nvim) opens up
" unless a file is passed to it on the command line
function! NerdTreeStartUp()
  if 0 == argc()
    NvimTreeToggle
  endif
endfunction

autocmd VimEnter * call NerdTreeStartUp()

lua << EOF
-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF
