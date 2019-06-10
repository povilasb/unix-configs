set nocompatible
syntax enable

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

set colorcolumn=79
set number

set noswapfile
" Use y+ to copy to system clipboard
set clipboard+=unnamedplus

" Show command effects incrementally.
set inccommand=nosplit

" Load other vim configs.
" NOTE: ~/.config/nvim/autoload could be used instead
for file in split(glob('~/.config/nvim/conf.d/*.vim'), '\n')
	exe 'source' file
endfor
