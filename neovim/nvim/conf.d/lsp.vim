" https://github.com/autozimu/LanguageClient-neovim configuration

" Required for operations modifying multiple buffers like rename.
set hidden

" See
" - https://github.com/palantir/python-language-server
" sudo pip3 install python-language-server pyflakes rope neovim
let g:LanguageClient_serverCommands = {
    \ 'python': ['/Users/povilas/.pyenv/shims/pyls']
    \ }
let g:LanguageClient_settingsPath = '~/.config/nvim/conf.d/lsp.json'

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
