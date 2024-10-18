	"""""""""""""""PLUGINS (VIM-PLUG)""""""""""""""""""""""
	call plug#begin()
	Plug 'girishji/vimcomplete'
	Plug 'dense-analysis/ale'
	Plug 'morhetz/gruvbox'
	Plug 'epheien/termdbg'
	call plug#end()

	"let g:termdebug_config = {}
	"let g:termdebug_config['variables_window'] = 1
	let g:variables_window_height = 5
	 
	"let b:ale_linters = {'c': ['cppcheck']}
	let g:vimcomplete_tab_enable = 1
	let g:ale_virtualtext_cursor = 'disabled'
	let g:ale_sign_column_always = 1
	let g:ale_c_cc_options = '-std=c99 -Wall -Wextra -Wpedantic'
	let g:ale_delay = 5
	let g:ale_cpp_cc_executable = 'gcc'
	"let g:gruvbox_contrast_dark = "hard"
	"let g:ale_lint_on_text_changed = 0
	"let g:ale_lint_on_insert_leave = 1 
	""""""""""""""""""""""""""""""""""""""""""""""""""""""


	"""""""""""""""""""""""MISC"""""""""""""""""""""""""""
	syntax on					"Enables syntax highlighting"
	filetype plugin indent on	"Enables plugin/indentation based on filetype"
	imap jj <Esc>				"Remaps jj to exit in normal mode"
	vnoremap Z :s/./\0\r/g <CR> "Writes line vertically"
	""""""""""""""""""""""""""""""""""""""""""""""""""""""

	""""""""""""""""""""EDITOR OPTIONS""""""""""""""""""""
	"Colors"
	colorscheme gruvbox
	set background=dark
	:hi SpellBad cterm=underline ctermfg=red ctermbg=NONE
	:hi FoldeColumn ctermfg=Green

	"Tab size is 8"
	set softtabstop=8
	set tabstop=8
	set shiftwidth=8

	set autowrite		"Write files before executing / compiling"
	set cc=80			"Line wrap size"
	set ttyfast			"Increase typing speed"
	set nu				"Set line counter on left"
	set foldcolumn=1	"Shows folding column on left"
	set incsearch		"Highlight the search"
	set showcmd			"Show number of selected chars"

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

	""""""""""""""""""""LANGUAGE MAPS"""""""""""""""""""""
	"Lua Maps"
	autocmd filetype lua nnoremap<F5> :!lua %  <CR>
	autocmd filetype lua nnoremap<F6> :!busted  <CR>
	autocmd filetype lua nnoremap<F7> :!love .  <CR>

	"HTML Maps"
	autocmd filetype html nnoremap<F5> :!xdg-open % <CR>

	"C Maps"
	autocmd filetype c nnoremap<F5> :!gcc -std=c99 -Wall -Wextra -Wpedantic -g %  <CR>
	autocmd filetype c nnoremap<F6> :!./a.out <CR>
	autocmd filetype c nnoremap<F7> :Termdbg gdb a.out -q <CR> <c-w>J <c-w>10-
	autocmd filetype c set cindent
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
