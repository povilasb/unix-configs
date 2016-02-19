set nocompatible
syntax enable

set colorcolumn=79
set number
set tabstop=8

" Load other vim configs.
for file in split(glob('~/.config/nvim/conf.d/*.vim'), '\n')
	exe 'source' file
endfor
