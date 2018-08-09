" Activate all the handy Windows key-bindings we're used to.
" source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

filetype plugin on

call plug#begin('~/vimfiles/plugged')
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'chriskempson/base16-vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'felixjung/vim-base16-lightline'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'bling/vim-bufferline'
call plug#end()

" search config
set ignorecase
set smartcase
set incsearch
set hlsearch

" Shortcut to format whole file
" Use Ctrl-Shift-F like Eclipse
" http://vim.wikia.com/wiki/Fix_indentation
map <C-S-F> mzgg=G`z

" configuration for swap and backup files
" http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
set directory=$TEMP\\\\

" enable rls
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif 
let g:LanguageClient_autoStart = 1
" Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :LspHover
nnoremap <silent> gd :LspDefinition
nnoremap <silent> <F2> :LspRename

" autocompletion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

" statusline
 if has("statusline")
    set laststatus=2
    set noshowmode
    "let g:lightline = {
      "\ 'colorscheme': 'base16_atelier_cave',
      "\ }
"    set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
    " statusline for Syntastic
"    set statusline+=%#warningmsg#
"    set statusline+=%{SyntasticStatuslineFlag()}
"    set statusline+=%*
 endif

" set theme
colorscheme base16-atelier-cave-light
"colorscheme base16-solarized-light

" enable unicode
" http://vim.wikia.com/wiki/Working_with_Unicode
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" enable line numbers
set number

" Toggle Tagbar with F9
nmap <F9> :TagbarToggle<CR>

" Toggle NERDTree with F8
map <F8> :NERDTreeToggle<CR>

" tab settings
" http://vim.wikia.com/wiki/Converting_tabs_to_spaces
set tabstop=4
set shiftwidth=4
set expandtab

" some settings for Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Navigate splits with arrow keys
" http://vim.wikia.com/wiki/Switch_between_Vim_window_splits_easily
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
