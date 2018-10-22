" dein =====================================================
" https://github.com/Shougo/dein.vim"

if &compatible
 set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('NLKNguyen/papercolor-theme')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable


" colors  =====================================================
set background=dark
set termguicolors
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }
colorscheme PaperColor


" edit =====================================================

" indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent

" search
set hlsearch        " highlight search

" window env
set relativenumber
set number
set ruler
set laststatus=2
set noshowmode
" set colorcolumn=80

" backspace
set backspace=indent,eol,start

" encoding
set encoding=utf-8
set fileencoding=utf-8

" leader
let mapleader=","

" map
" jj to escape
" inoremap jj <esc>

" move by line on screen
nnoremap j gj
nnoremap k gk

" allow saving as sudo when forget to start vim as sudo
cmap w!! w !sudo tee 1> /dev/null %


" filetypes =================================================

" JS

autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" JSON
" autocmd BufNewFile,BufReadPost *.json set filetype=json
" autocmd FileType json setlocal equalprg=python\ -m\ json.tool
" autocmd FileType json setlocal equalprg=jq\ '.[]'\ -\ 2>/dev/null

" Make
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType markdown setlocal tabstop=4 shiftwidth=4 softtabstop=4

