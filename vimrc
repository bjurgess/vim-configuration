" Vundle--------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'lokaltog/vim-powerline'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'
Plugin 'klen/python-mode'
Plugin 'flazz/vim-colorschemes'


call vundle#end()            " required
filetype plugin indent on    " required

" Colors----------------------------------------------------------------------

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

syntax enable
colorscheme badwolf

" Spaces and tabs------------------------------------------------------------
set tabstop=4
set softtabstop=4
set expandtab
set mouse=a
set autoindent
set shiftwidth=4
set shiftround

"" UI Config
set number
set showcmd
filetype indent on
set wildmenu
set lazyredraw
set showmatch

"" Searching
set incsearch
set hlsearch
noremap <leader><space> :nohlsearch<CR>		"Turn off search highlight

"" Folding
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

"" Movement
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap gv `[v`]
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resizing------------------------------------------------------------------
set winheight=30
set winminheight=5
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

"" Leader Shortcuts
let mapleader=","
inoremap jk <esc>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Ag

" Saving--------------------------------------------------------------------
nnoremap <silent> <C-s> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
nmap <C-s> :w<CR>
vmap <C-s> <Esc><C-s><CR>gv
imap <C-s> <Esc><C-s>

nnoremap <silent> <C-q> :if expand("%") == ""<CR>browse confirm q<CR>else<CR>confirm q<CR>endif<CR>
nmap <C-q> :q<CR>
vmap <C-q> <Esc>:q<CR>gv
imap <C-q> <Esc>:q<CR>

" CtrlP---------------------------------------------------------------------
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_switch_buffer=0
let g:ctrlp_working_path_mode='ra'
"let g:ctrlp_user_command='ag %s -l --nocolor --hidden -g '
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" NERDTree-----------------------------------------------------------------
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDTree Tabs-------------------------------------------------------------
let g:nerdtree_tabs_open_on_console_startup=1

" Powerline-----------------------------------------------------------------
let g:Powerline_symbols = 'fancy'

" Tmux----------------------------------------------------------------------
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Autogroups----------------------------------------------------------------
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Backups-------------------------------------------------------------------
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Custom Functions
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
