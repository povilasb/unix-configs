setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab

setlocal foldmethod=indent

setlocal colorcolumn=100

" pr<Space> is replaced with "println!()"
" and cursor is placed between the brackets.
iab pr println!("{}",);<Left><Left>
iab ass assert_that!();<Left><Left>
