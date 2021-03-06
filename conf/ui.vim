set cursorline

" enable line numbers
set number

" statusline
if has("statusline")
    set laststatus=2
    set noshowmode
    let g:lightline = {
                \ 'colorscheme': 'PaperColor'
                \ }
endif

" set the font for the GUI
if has('gui_running')
    if has("win32")
        set guifont=Consolas:h11
    else
        set guifont=Inconsolata\ 11
    endif
    " remove toolba
    " http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
endif

" set theme
"colorscheme base16-atelier-cave-light
"colorscheme base16-solarized-dark
set background=light
colorscheme PaperColor
