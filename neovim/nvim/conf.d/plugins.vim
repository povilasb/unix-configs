call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'cespare/vim-toml'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Rust related plugins
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" Async linting and LSP integration
Plug 'w0rp/ale'

call plug#end()
