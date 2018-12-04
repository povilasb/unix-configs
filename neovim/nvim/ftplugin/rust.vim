setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab

setlocal foldmethod=syntax

setlocal colorcolumn=100

" pr<Space> is replaced with "println!()"
" and cursor is placed between the brackets.
iab pr println!("{}",);<Left><Left>
iab ass assert_that!();<Left><Left>

" see: http://vim.wikia.com/wiki/Syntax_folding_of_Vim_scripts
syn region commentCopyright
    \ start="// Copyright.*"
    \ end="// Software.*"
    \ transparent fold keepend
