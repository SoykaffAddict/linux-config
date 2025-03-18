"""""""""""""""PLUGINS (VIM-PLUG)""""""""""""""""""""""
call plug#begin()
Plug 'girishji/vimcomplete'
Plug 'dense-analysis/ale'
Plug 'morhetz/gruvbox'
Plug 'epheien/termdbg'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'bkad/CamelCaseMotion'
call plug#end()

let g:variables_window_height = 5
let g:vimcomplete_tab_enable = 1
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_sign_column_always = 1
let g:ale_c_cc_options = '-std=c99 -Wall -Wextra -Wpedantic -Wvla'
let g:ale_cpp_cc_options = '-std=c++20 -Wall -Wextra -Wpedantic -Wvla'
"let g:ale_delay = 5
let g:ale_c_cc_executable = 'gcc'
let g:ale_cpp_cc_executable = 'g++'
let g:ale_completion_autoimport = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""EDITOR OPTIONS""""""""""""""""""""
"Colors"
colorscheme gruvbox
set background=dark
:hi SpellBad cterm=underline ctermfg=red ctermbg=NONE
:hi FoldeColumn ctermfg=Green

"Tab size is 4 instead of 8"
set softtabstop=8
set tabstop=8
set shiftwidth=8

"Cursor style"
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"Makes vim not continue comments"
autocmd FileType * set formatoptions-=c formatoptions-=r formatoptions-=o

"Visible WhiteSpaces.
set list listchars+=space:. listchars-=eol:$
set list listchars+=tab:\|\ \ 

"Highlight toggle"
autocmd filetype * nnoremap<C-S> :set hlsearch! <CR>

"GDB opt
set t_vb=
hi ErrorMsg NONE
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""MISC"""""""""""""""""""""""""""
syntax on					"Enables syntax highlighting"
filetype plugin indent on	"Enables plugin/indentation based on filetype"
imap jj <Esc>				"Remaps jj to exit in normal mode"
vnoremap Z :s/./\0\r/g <CR> "Writes line vertically"
set autowrite				"Write files before executing / compiling"
set cc=80					"Line wrap size"
set ttyfast					"Increase typing speed"
set nu						"Set line counter on left"
set foldcolumn=1			"Shows folding column on left"
set incsearch				"Highlight the search"
set showcmd					"Show number of selected chars"
set scrolloff=5				"Sets vim scrollable area"

"Remaps <CTRL-J> to snippets"
imap <C-J> <Plug>snipMateNextOrTrigger
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""LANGUAGE MAPS"""""""""""""""""""""
"Lua Maps"
autocmd filetype lua nnoremap<F5> :!lua %  <CR>
autocmd filetype lua nnoremap<F6> :!busted  <CR>
autocmd filetype lua nnoremap<F7> :!love .  <CR>

"HTML Maps"
autocmd filetype html nnoremap<F5> :!xdg-open % <CR>

"C Maps"
autocmd filetype c nnoremap<F5> :!gcc -std=c99 -Wall -Wextra -Wpedantic -Wvla -g %  <CR>
autocmd filetype c nnoremap<F6> :!./a.out <CR>
autocmd filetype c nnoremap<F7> :Termdbg gdb a.out -q <CR> <c-w>J <c-w>10-
autocmd filetype c nnoremap<F8> :!make F=% <CR>
autocmd filetype c setlocal cindent

"Cpp Maps"
autocmd filetype cpp nnoremap<F5> :!g++ -std=c++20 -Wall -Wextra -Wpedantic -Wvla -g %  <CR>
autocmd filetype cpp nnoremap<F6> :!./a.out <CR>
autocmd filetype cpp nnoremap<F7> :Termdbg gdb a.out -q <CR> <c-w>J <c-w>10-
autocmd filetype cpp nnoremap<F8> :!make % <CR>
autocmd filetype cpp setlocal cindent

"C GTK Maps"
autocmd Bufread,BufNewFile *.gtk setlocal cindent
autocmd Bufread,BufNewFile *.gtk setlocal filetype=c
autocmd Bufread,BufNewFile *.gtk setlocal softtabstop=0
autocmd Bufread,BufNewFile *.gtk setlocal shiftwidth=2
autocmd Bufread,BufNewFile *.gtk setlocal tabstop=2
autocmd Bufread,BufNewFile *.gtk setlocal noexpandtab
let gtk_flags = "-I/usr/include/gtk-4.0 -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/sysprof-6 -I/usr/include/harfbuzz -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/fribidi -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/x86_64-linux-gnu -I/usr/include/webp -I/usr/include/graphene-1.0 -I/usr/lib/x86_64-linux-gnu/graphene-1.0/include -mfpmath=sse -msse -msse2 -pthread -lgtk-4 -lpangocairo-1.0 -lpango-1.0 -lharfbuzz -lgdk_pixbuf-2.0 -lcairo-gobject -lcairo -lvulkan -lgraphene-1.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0"
	autocmd Bufread,BufNewFile *.gtk let g:ale_c_cc_options = gtk_flags
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""FILETYPE ADJUST""""""""""""""""""""
"Read etlua files as HTML"
autocmd BufNewFile,BufRead *.etlua set filetype=html
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""FOLDING SAVE"""""""""""""""""""""""
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""CAMELCASEMOTION""""""""""""""""""""
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

imap <silent> <S-Left> <C-o><Plug>CamelCaseMotion_b
imap <silent> <S-Right> <C-o><Plug>CamelCaseMotion_w
""""""""""""""""""""""""""""""""""""""""""""""""""""""
