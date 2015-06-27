set nocompatible
if filereadable(expand('$VIM/vimfiles/autoload/pathogen.vim')) ||
 \ filereadable(expand('$VIMRUNTIME/autoload/pathogen.vim'))
	execute pathogen#infect()
endif
if has('gui_running')
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
	if has('unix')
		set guifont=Source\ Code\ Pro\ Light\ 14
		function! CJK_Font(mode)
			if a:mode == 0
				set guifontwide=Source\ Han\ Sans\ TW\ Light\ 16
			elseif a:mode == 1
				set guifontwide=Source\ Han\ Sans\ CN\ Light\ 16
			elseif a:mode == 2
				set guifontwide=Source\ Han\ Sans\ JP\ Light\ 16
			elseif a:mode == 3
				set guifontwide=Source\ Han\ Sans\ KR\ Light\ 16
			endif
		endfunction
	elseif has('win32') || has('win64')
		autocmd GUIEnter * winpos 0 0
		autocmd InsertEnter * set noimdisable
		autocmd InsertLeave * set imdisable
		set guifont=Source_Code_Pro_Light:h14
		function! CJK_Font(mode)
			if a:mode == 0
				set guifontwide=Gen_Jyuu_Gothic_Monospace_Light:h16
			elseif a:mode == 1
				set guifontwide=Gen_Shin_Gothic_Monospace_Light:h16
			elseif a:mode == 2
				set guifontwide=HanaMinA:h16
			elseif a:mode == 3
				set guifontwide=MingLiU:h16
			endif
		endfunction
	endif
	function! CJK_Font_Select()
		if !exists("s:cjk_font_select")
			let s:cjk_font_select = 1
		endif
		if s:cjk_font_select == 0
			call CJK_Font(0)
			let s:cjk_font_select = 1
		elseif s:cjk_font_select == 1
			call CJK_Font(1)
			let s:cjk_font_select = 2
		elseif s:cjk_font_select == 2
			call CJK_Font(2)
			let s:cjk_font_select = 3
		elseif s:cjk_font_select == 3
			call CJK_Font(3)
			let s:cjk_font_select = 0
		endif
	endfunction
	call CJK_Font(0)
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
if has('unix')
	set clipboard=unnamedplus
	set fileformats=unix,dos
elseif has('win32') || has('win64')
	set clipboard=unnamed
	set fileformats=dos,unix
	set shellcmdflag=/u/c
endif
set ambiwidth=double
set autoindent
set autoread
set backspace=indent,eol,start
set cursorline
set diffopt=filler,horizontal
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,ucs-2le,taiwan,prc,japan,korea
set foldcolumn=1
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
set nobackup
set nocursorcolumn
set noswapfile
set nowritebackup
syntax enable
autocmd InsertEnter *
\ set cursorcolumn nocursorline number norelativenumber colorcolumn=40,80
autocmd InsertLeave *
\ set nocursorcolumn cursorline nonumber relativenumber colorcolumn=
