" show special symbols: tabs, EOL, trailing whitespaces
set list listchars=tab:>-,eol:$,trail:.
highlight NonText ctermfg=0
highlight SpecialKey ctermfg=0

" Display white spaces.
function! Whitespace()
	if !exists('b:ws')
		highlight Conceal ctermbg=NONE ctermfg=grey cterm=NONE guibg=NONE guifg=#585858 gui=NONE
		highlight link Whitespace Conceal
		let b:ws = 1
	endif

	syntax clear Whitespace
	syntax match Whitespace / / containedin=ALL conceal cchar=·
	setlocal conceallevel=2 concealcursor=c
endfunction

augroup Whitespace
	autocmd!
	autocmd BufEnter,WinEnter * call Whitespace()
augroup END
