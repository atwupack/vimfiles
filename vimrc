if has("win32")
    "    language en-US
    language English_United States
else
    language en_US.utf8
endif

if !has('nvim')
    source $VIMRUNTIME/defaults.vim
endif
if has("win32")
    " Activate all the handy Windows key-bindings we're used to.
    " source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
endif

filetype plugin on
filetype plugin indent on

if isdirectory($HOME . "/vimfiles")
    call plug#begin('~/vimfiles/plugged')
else
    call plug#begin('~/.vim/plugged')
endif
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'prabirshrestha/async.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree'] }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTree'] }
"Plug 'chriskempson/base16-vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
"Plug 'felixjung/vim-base16-lightline'
"Plug 'daviesjamie/vim-base16-lightline'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'bling/vim-bufferline'
Plug 'https://gitlab.com/dbeniamine/todo.txt-vim.git'
Plug 'moll/vim-bbye'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'purescript-contrib/purescript-vim' , { 'for': 'purescript' }
Plug 'ElmCast/elm-vim' , { 'for': 'elm' }
Plug 'idris-hackers/idris-vim' , { 'for': 'idris' }
"Plug 'Shougo/deol.nvim'
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

" source all configuration for the different plugins
if has("win32")
    runtime! conf\*.vim
else
    runtime! conf/*.vim
endif

" flashy
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

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

" autocompletion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

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

" Toggle Tagbar with F9
nmap <F9> :TagbarToggle<CR>

" some settings for Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

