set history=1000  "store a ton of history
set nobackup      " enable backups
set nowritebackup
set noswapfile    " It's 2012, Vim.

if exists("+undofile")
  " This is only present in 7.3+
  if isdirectory($HOME . '/.local/share/nvim/undo') == 0
    :silent !mkdir -p ~/.local/share/nvim/undo > /dev/null 2>&1
  endif
  set undodir=~/.local/share/nvim/undo " undo files
  set undofile
  set undolevels=1000   " maximum number of changes that can be undone
  set undoreload=10000  " maximum number of lines to save for undo on a buffer reload
endif
