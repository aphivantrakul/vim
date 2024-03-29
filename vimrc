set nocompatible " don't use vi settings 

syntax enable " enable syntax and plugins (for netrw)
filetype plugin on
set number relativenumber " show relative and absolute line numbers
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set number relativenumber
set path=.,,,**
set hidden " allow switch buffers without saving
set shortmess-=S " count number of search matches
let g:netrw_fastbrowse = 0
set t_Co=256 " use 256 colors on the terminal
set cursorline " underline current line
set cursorcolumn " underline current line
hi CursorLine cterm=none ctermbg=253 ctermfg=none " highlight current line with grey background
hi CursorColumn cterm=none ctermbg=254 ctermfg=none " highlight current line with grey background
set ignorecase " case insensitive search
set smartcase " case insensitive search
set wildmenu " show tab options when searching
set wildignore+=*/node_modules/*,*/tmp/*,*/public/* " ignore these folders when searching
set wildmode=list:longest,full
set clipboard=unnamed " copy from vim paste into system using * register
set grepprg=rg\ --smart-case\ --vimgrep
highlight Pmenu ctermbg=245 " change color of autocomplete box
set tabstop=2 " 2 spaces for a tab
set shiftwidth=2
set softtabstop=2
set expandtab

if &diff " when using vimdiff
  syntax off " turn syntax highlight off
endif

set linebreak

" block cursor in normal mode, beam in insert mode (alacritty terminal)
let &t_SI = "\<Esc>[6 q" " insert mode
let &t_SR = "\<Esc>[4 q" " replace mode
let &t_EI = "\<Esc>[0 q" " normal mode

setlocal foldmethod=indent
set expandtab
hi Visual cterm=none ctermbg=251 ctermfg=white
set nofoldenable
set title

nnoremap <SPACE> <Nop>
let mapleader=" "
map <leader>p :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>

" Vim Plug
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
call plug#end()

nnoremap <SPACE> <Nop>
let mapleader=" "
map <leader>f :Files!<CR>
map <leader>r :Rg!<CR>

let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
