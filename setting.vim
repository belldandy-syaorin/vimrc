set nocompatible
if has('win32') || has('win64')
	language english
	set fileformats=dos,unix
elseif has('unix')
	language en_US.UTF-8
	set fileformats=unix,dos
endif
if v:version >= 703
	autocmd InsertEnter * set nocursorcolumn nocursorline relativenumber colorcolumn=
	autocmd InsertLeave * set cursorcolumn cursorline number colorcolumn=40,80
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
		set guifont=MingLiU:h14
	elseif has('unix')
		set guifont=WenQuanYi\ Zen\ Hei\ Mono\ 14
	endif
else
	set columns=80 lines=25
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
