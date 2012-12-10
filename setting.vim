set nocompatible
if filereadable(expand('$VIMRUNTIME/autoload/pathogen.vim')) ||
 \ filereadable(expand('$VIM/vimfiles/autoload/pathogen.vim'))
	call pathogen#infect()
endif
if has('win32') || has('win64')
	set fileformats=dos,unix
elseif has('unix')
	set fileformats=unix,dos
endif
if v:version >= 703
	autocmd InsertEnter *
	\ set nocursorcolumn nocursorline relativenumber colorcolumn=
	autocmd InsertLeave *
	\ set cursorcolumn cursorline number colorcolumn=40,80
	set colorcolumn=40,80
else
	autocmd InsertEnter * set nocursorcolumn nocursorline
	autocmd InsertLeave * set cursorcolumn cursorline
endif
if has('gui_running')
	autocmd GUIEnter * winpos 0 0
	highlight Normal guibg=black guifg=white
	highlight User1 guibg=white guifg=red
	highlight User2 guibg=white guifg=lightred
	highlight User3 guibg=white guifg=darkred
	set guioptions-=e
	set guioptions-=m
	set guioptions-=T
	set statusline=[%3*%t%*]%1*%m%r%h%w%y%*
	set statusline+=%=
	set statusline+=[%2*%{mode()}%*]
	set statusline+=[%1*%{&enc}%*]
	set statusline+=[%1*%{&fenc}%*(%1*%{&bomb}%*),%1*%{&ff}%*]
	set statusline+=[%2*%l%*,%2*%c%*(%3*%p%*%%/%3*%L%*)]
	if has('win32') || has('win64')
		autocmd InsertEnter * set noimdisable
		autocmd InsertLeave * set imdisable
		set guifont=Source_Code_Pro_Light:h14
		set guifontwide=MingLiU:h17
	elseif has('unix')
		set guifont=Source\ Code\ Pro\ Light\ 14
		set guifontwide=WenQuanYi\ Micro\ Hei\ Mono\ 17
	endif
else
	set statusline=[%t]%m%r%h%w%y
	set statusline+=%=
	set statusline+=[%{mode()}]
	set statusline+=[%{&enc}]
	set statusline+=[%{&fenc}(%{&bomb}),%{&ff}]
	set statusline+=[%l,%c(%p%%/%L)]
endif
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamed
set cursorcolumn
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,taiwan,prc,japan,korea
set foldmethod=indent
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>-,eol:<,trail:=
set number
set showcmd
set smartcase
set smartindent
set splitbelow
set splitright
set wrap
syntax enable
set nobackup
set noswapfile
set nowritebackup
