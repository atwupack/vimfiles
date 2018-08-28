" configure rls for rust
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

if executable('hie-wrapper')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'hie',
        \ 'cmd': {server_info->['hie-wrapper']},
        \ 'whitelist': ['haskell'],
        \ })
endif


let g:LanguageClient_autoStart = 1

" Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :LspHover<CR>
nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> <F2> :LspRename<CR>
