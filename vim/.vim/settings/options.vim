"set mouse-=a
if has('mouse')
"  set mouse=a
endif

set t_Co=256
" colorscheme deepsea
colorscheme Tomorrow-Night

" Enable clipboard integration
"set clipboard=unnamed

set foldmethod=indent
set foldlevelstart=9999
set nostartofline
set cursorline
set hidden

set number

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set ignorecase             " ignore case when searching
set smartcase

set autoread                " Update open files when changed externally
set laststatus=2

set termencoding=utf-8
set encoding=utf-8
set showmode
set noshowcmd

set ttyfast

" ================ Scrolling ========================

set scrolloff=3         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=3

" ===================================================

" ================ Indentation ======================

set autoindent
set backspace=2
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set wrap

" ===================================================

"set showmatch              " brackets/braces that is
"set mat=3                  " duration to show matching brace (1/10 sec)

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

set matchpairs+=<:>
set vb t_vb= " Turn off the bell, this could be more annoying, but I'm not sure how

" More sane colors of matching brackets and parens
" highlight MatchParen cterm=bold ctermbg=bg ctermfg=Red

set list
set listchars=tab:>.,trail:.,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.

" -------------------------------
" https://vim.fandom.com/wiki/Remove_unwanted_spaces#:~:text=One%20way%20to%20make%20sure,all%20trailing%20whitespace%20before%20saving.
" One way to make sure to remove all trailing whitespace in a file is to set
" an autocmd in your .vimrc file. Every time the user issues a :w command, Vim
" will automatically remove all trailing whitespace before saving.
autocmd BufWritePre * %s/\s\+$//e
" -------------------------------
set foldmethod=indent       " automatically fold by indent level
set foldlevelstart=9999
