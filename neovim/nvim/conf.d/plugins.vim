call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'cespare/vim-toml'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Rust related plugins
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" LSP integration
" NOTE: next neovim release SHOULD have LSP client built-in, hence remove this
" plugin.
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()
