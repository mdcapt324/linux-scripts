set nocompatible			" be iMproved, required
filetype off				" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'		" Vundle
Plugin 'itchyny/lightline.vim'		" Lightline statusbar
Plugin 'ap/vim-css-color'		" Color preview for css colors
Plugin 'vimwiki/vimwiki'		" Vim wiki

" All of your Plugins must be added before the following line
call vundle#end()			" required
filetype plugin indent on		" required

let g:lightline = {
	\ 'colorscheme': 'darcula',
	\ 'active': {
	\ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
	\ }
	\ }

syntax on				" turn syntax highlighting on
map! ii <Esc> 				" map ii to the escape key
set number relativenumber		" show line number and relative numbering
set laststatus=2			" show lightline status bar
set noshowmode				" disable the mode display under status bar
