" Note that rls must be installed manually.
" See: https://github.com/rust-lang/rls

let b:ale_linters = {'rust': ['rls', 'cargo', 'rustc']}
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_completion_enabled = 1
