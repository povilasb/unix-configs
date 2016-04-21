set nocompatible
syntax enable

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

set colorcolumn=79
set number
set tabstop=8

set noswapfile

" Load other vim configs.
for file in split(glob('~/.config/nvim/conf.d/*.vim'), '\n')
	exe 'source' file
endfor
