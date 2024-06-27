execute pathogen#infect()
packloadall

set nu
imap jj <Esc>
syntax on
set softtabstop=4
set tabstop=4
set shiftwidth=4
set autowrite

filetype plugin indent on

"Makes vim not continue comments
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Lua Maps
autocmd filetype lua nnoremap<F5> :!lua %  <CR>
autocmd filetype lua nnoremap<F6> :!busted  <CR>
autocmd filetype * nnoremap<F7> :set hlsearch! <CR>
autocmd filetype lua nnoremap<F8> :!love .  <CR>

"Wrap line vertically 
vnoremap Z :s/./\0\r/g <CR>

"Read etlua files as HTML
autocmd BufNewFile,BufRead *.etlua set filetype=html
