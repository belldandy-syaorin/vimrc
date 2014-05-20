set nocompatible
if filereadable(expand('$VIM/vimfiles/autoload/pathogen.vim')) ||
 \ filereadable(expand('$VIMRUNTIME/autoload/pathogen.vim'))
	execute pathogen#infect()
endif
if has('win32') || has('win64')
	set clipboard=unnamed
	set fileformats=dos,unix
	set shellcmdflag=/u/c
elseif has('unix')
	set clipboard=unnamedplus
	set fileformats=unix,dos
endif
autocmd InsertEnter *
\ set cursorcolumn cursorline number norelativenumber colorcolumn=40,80
autocmd InsertLeave *
\ set nocursorcolumn nocursorline nonumber relativenumber colorcolumn=
if has('gui_running')
	autocmd GUIEnter * winpos 0 0
	highlight Normal guibg=black guifg=white
	highlight User1 guibg=white guifg=red
	highlight User2 guibg=white guifg=lightred
	highlight User3 guibg=white guifg=darkred
	set guioptions-=e
	set guioptions-=m
	set guioptions-=T
	set statusline=[%2*%t%*]%3*%m%r%h%w%y%*
	set statusline+=%=
	set statusline+=[%1*%{mode()}%*]
	set statusline+=[%1*%{get(undotree(),'seq_cur')}%*/
			\%1*%{get(undotree(),'seq_last')}%*]
	set statusline+=[%1*%{&encoding}%*]
	set statusline+=[%1*%{&fileencoding}%*(%1*%{&bomb}%*),%1*%{&fileformat}%*]
	set statusline+=[%1*%l%*,%1*%c%*(%1*%p%*%%/%1*%L%*)]
	if has('win32') || has('win64')
		autocmd InsertEnter * set noimdisable
		autocmd InsertLeave * set imdisable
		set guifont=Source_Code_Pro_Light:h14
		set guifontwide=MingLiU:h17
	elseif has('unix')
		set guifont=Source\ Code\ Pro\ Light\ 14
		set guifontwide=WenQuanYi\ Micro\ Hei\ Lite\ Mono\ 17
	endif
else
	set statusline=[%t]%m%r%h%w%y
	set statusline+=%=
	set statusline+=[%{mode()}]
	set statusline+=[%{get(undotree(),'seq_cur')}/
			\%{get(undotree(),'seq_last')}]
	set statusline+=[%{&encoding}]
	set statusline+=[%{&fileencoding}(%{&bomb}),%{&fileformat}]
	set statusline+=[%l,%c(%p%%/%L)]
endif
set ambiwidth=double
set autoindent
set autoread
set backspace=indent,eol,start
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,ucs-2le,taiwan,prc,japan,korea
set foldmethod=indent
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>-,eol:<,trail:=
set relativenumber
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
