"let bundles_installed=1
"let vundle_readme=expand('~/.local/share/nvim/site/autoload/plug.vim')
"if !filereadable(vundle_readme)
"  echo "Installing Vundle.."
"  echo ""
"  silent !mkdir -p ~/.local/share/nvim/site/autoload
"  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"  let bundles_installed=0
"endif
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

"echo 'sourcing vundle.vim'
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

let g:plug_url_format = 'git@github.com:%s.git'

" let Vundle manage Vundle, required
"Plug 'gmarik/Vundle.vim'

" ================= Naviagtion ====================
Plug 'preservim/nerdtree'
  let NERDTreeShowBookmarks=1
  let NERDTreeSortOrder=[]

  augroup ps_nerdtree
      au!

      au Filetype nerdtree setlocal nolist
      au Filetype nerdtree nnoremap <buffer> K :q<cr>
  augroup END

  let NERDTreeHighlightCursorline = 1
  let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                      \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                      \ '.*\.o$', 'db.db', 'tags.bak']

  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let g:NERDTreeMouseMode = 2

Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_extensions = ['funky', 'cmdpalette']

Plug 'tacahiroy/ctrlp-funky'

" Plug 'danielcbaldwin/ctrlp-modified.vim'
" Plug 'endel/ctrlp-filetype.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'

Plug 'Lokaltog/vim-easymotion'
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_use_smartsign_us = 1

Plug 'majutsushi/tagbar'
  let g:tagbar_compact = 1
  let g:tagbar_sort = 0
  let g:tagbar_autofocus = 1
" =================================================

" ==================== Color ======================
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'crusoexia/vim-monokai'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'fatih/molokai'
Plug 'antlypls/vim-colors-codeschool'
" =================================================

" ===================== UI ========================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme             = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
" =================================================

" ================== Commands =====================
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
  autocmd FileType ruby set commentstring=#\ %s
  autocmd FileType vim set commentstring=\"\ %s
  autocmd FileType javascript set commentstring=\/\/\ %s
" =================================================

" ============= Language Additions ================
Plug 'scrooloose/syntastic'
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0
  let g:syntastic_go_go_build_args = "-o /dev/null"
  let g:syntastic_go_checkers=['go']
  let g:syntastic_javascript_checkers = ['jshint']
  let g:syntastic_sh_checkers = ['sh', 'shfmt']
  "let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
  "nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Go
Plug 'fatih/vim-go'
  let g:go_auto_type_info = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
  let g:go_fmt_fail_silently = 1

" Ruby
Plug 'vim-ruby/vim-ruby'
  let ruby_operators=1
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/ruby-matchit'
Plug 'vim-scripts/taglist.vim'

" CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'leshill/vim-json'
Plug 'itspriddle/vim-jquery'

" HTML
Plug 'othree/html5.vim'

" Other Languages
Plug 'mutewinter/nginx.vim'
Plug 'hashivim/vim-terraform'
Plug 'JamshedVesuna/vim-markdown-preview'
" =================================================
call plug#end()
"call vundle#end()
if bundles_installed == 0
  echo "Installing Plugs, please ignore key map error messages"
  echo ""
  :PlugInstall
endif
"filetype plugin indent on
