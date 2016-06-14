setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab

setlocal foldmethod=indent

" pr<Space> is replaced with "print('')"
" and cursor is placed between the brackets.
iab pr print()<Left>
iab ass assert_that()<Left>
iab desc def describe_():<Left><Left><Left>
iab it def it_():<Left><Left><Left>
