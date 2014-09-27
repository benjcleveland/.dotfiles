" vundle setup
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

" line numbers
set number

" Set the initial window size
if has("gui_running")
    set lines=70
    set columns=80
endif

" Remove silly menus
set guioptions-=m
set guioptions-=T

" Enable spellcheck
set spell spelllang=en_us

" disable auto comment for //
au Filetype c,cpp set comments-=:// comments+=f://

" change the color scheme
colorscheme desert

" go one more character at the end of a line
set virtualedit=onemore
