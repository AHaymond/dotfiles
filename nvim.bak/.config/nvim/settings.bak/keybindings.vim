let mapleader = ","
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" Allow saving of files as sudo when I forgot to start vim using sudo.
"cmap w!! w !sudo tee > /dev/null %
cmap w!! SudaWrite

" Insert a single character, allows for repetition such as 5s
" http://vim.wikia.com/wiki/Insert_a_single_character
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" Reselect visual block after indent/outdent
" http://www.vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv

" select all
nnoremap <Leader>a ggVG

" open a split window and change selection to it
nnoremap <leader>w <C-w>v<C-w>l

" Toggle search highlights
" http://www.vimbits.com/bits/21
nnoremap <silent><Leader><space> :nohls<CR>

nnoremap <Leader>pp :set invpaste paste?<CR>
set pastetoggle=<Leader>pp

" Disable paste mode when leaving Insert Mode
" http://www.vimbits.com/bits/170
au InsertLeave * set nopaste

" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

" Insert blank lines without going into insert mode
" http://www.vimbits.com/bits/176
" nmap t o<ESC>k
" nmap T O<ESC>j

" Make Y behave like other capitals
nmap Y y$

" Run GoImports
nmap <C-i> :GoImports<CR>

" Fix for TMUX
" if &term =~ '^screen'
"     " tmux will send xterm-style keys when its xterm-keys option is on
"     execute "set <xUp>=\e[1;*A"
"     execute "set <xDown>=\e[1;*B"
"     execute "set <xRight>=\e[1;*C"
"     execute "set <xLeft>=\e[1;*D"
" endif
" map <Esc>[B <Down>

" So we can use the arrow keys but still act like regular vim
" The imap turn off the arrow keys when in insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
nmap <up> gk
nmap <down> gj
nmap <left> h
nmap <right> l
vmap <up> gk
vmap <down> gj
vmap <left> h
vmap <right> l

" Spelling
nmap <leader>s :setlocal spell! spelllang=en_us<CR>

" Set list Chars - for showing characters that are not
" normally displayed i.e. whitespace, tabs, EOL
nmap <silent><leader>ll :set list!<CR>

" Tagbar key binding
nnoremap <leader>l :TagbarToggle<CR>

" NerdTree key binding
nnoremap <leader>n :NvimTreeToggle<CR>

" Shellcheck key binding
nnoremap <leader>s :SyntasticCheck shellcheck<CR>

" ctrl+p Key Bindings
nmap <C-b> :CtrlPBuffer<CR>
nnoremap <C-l> :CtrlPFunky<CR>
" narrow the list down with a word under cursor
" nnoremap <Leader>k :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" map <C-m> :CtrlPModified<CR>
" map <C-x> :CtrlPBranch<CR>
" map <C-y> :CtrlPFiletype<CR>
map <C-c> :CtrlPCmdPalette<CR>

" Move Lines
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Easymotion
"map f <Plug>(easymotion-f)
"map F <Plug>(easymotion-F)
nmap <Leader>J <Plug>(easymotion-eol-j)
nmap <Leader>K <Plug>(easymotion-eol-k)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
nmap t <Plug>(easymotion-t)
nmap T <Plug>(easymotion-t2)
omap t <Plug>(easymotion-bd-tl)

" Other save options incase, because i always mess up
:command WQ wq
:command Wq wq
:command W w
:command Q q

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" Dash plugin key bindings for the Mac OS X Dash app
nmap <silent> <leader>d <Plug>DashSearch
