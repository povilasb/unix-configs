setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab

setlocal foldmethod=indent

" pr<Space> is replaced with "print('')"
" and cursor is placed between the brackets.
iab pr print('')<Left><Left>
imap <F2> <C-]>
