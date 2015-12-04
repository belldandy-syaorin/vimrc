set nocompatible
if filereadable(expand('$VIM/vimfiles/autoload/pathogen.vim')) ||
 \ filereadable(expand('$VIMRUNTIME/autoload/pathogen.vim'))
	let s:use_pathogen = 1
else
	let s:use_pathogen = 0
endif
if has('unix') && $USER == 'root'
	let s:use_root = 1
else
	let s:use_root = 0
endif
if s:use_pathogen == 1 && s:use_root == 0
	execute pathogen#infect()
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
if has('unix')
	set clipboard=unnamedplus
	set fileformats=unix,dos
	if has('gui_running')
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
	endif
elseif has('win32') || has('win64')
	set clipboard=unnamed
	set fileformats=dos,unix
	set shellcmdflag=/u/c
	if has('gui_running')
		autocmd GUIEnter * winpos 0 0
		autocmd InsertEnter * set noimdisable
		autocmd InsertLeave * set imdisable
		set guifont=Source_Code_Pro_Light:h14
		function! CJK_Font(mode)
			if a:mode == 0
				set guifontwide=Gen_Jyuu_Gothic_Monospace_Extra:h16
			elseif a:mode == 1
				set guifontwide=Gen_Shin_Gothic_Monospace_Extra:h16
			elseif a:mode == 2
				set guifontwide=HanaMinA:h17
			elseif a:mode == 3
				set guifontwide=MingLiU:h17
			endif
		endfunction
		function! s:ModCmdBackSlash()
			return substitute(getcmdline(), '\\ ', ' ', 'g')
		endfunction
		cnoremap <A-m> <C-\>e(<SID>ModCmdBackSlash())<CR>
	endif
endif
if has('gui_running')
	noremap! <A-h> <Left>
	noremap! <A-l> <Right>
	noremap! <A-j> <Down>
	noremap! <A-k> <Up>
	noremap! <A-w> <C-o>w
	noremap! <A-b> <C-o>b
	noremap! <A-e> <C-o>e
	call CJK_Font(0)
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
	nnoremap <F7> :call CJK_Font_Select()<CR>:echo 'guifontwide ='&guifontwide<CR>
	highlight Normal guibg=black guifg=white
	highlight User1 guibg=white guifg=red
	highlight User2 guibg=white guifg=green
	highlight User3 guibg=white guifg=blue
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
if v:version >= 704 && has('patch399')
	set cryptmethod=blowfish2
elseif v:version >= 703
	set cryptmethod=blowfish
endif
" loadplugins
if (&loadplugins == 1) && s:use_pathogen == 1 && s:use_root == 0
	" jedi-vim
		if has('python') && has('python3')
			let g:jedi#force_py_version = 2
		endif
	" neocomplcache
		let g:neocomplcache_enable_at_startup = 1
		if !exists('g:neocomplcache_force_omni_patterns')
			let g:neocomplcache_force_omni_patterns = {}
		endif
		autocmd FileType python setlocal omnifunc=jedi#completions
		let g:jedi#auto_vim_configuration = 0
		let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
	" vcscommand
		if has('gui_running')
			nnoremap <F2> :VCSDiff<CR>
		endif
	" vim-diff-enhanced
		autocmd VimEnter * PatienceDiff
	" vim_wm
		if has('win32') || has('win64')
			if !exists("g:enable_vim_wm_defaulthotkey")
				let g:enable_vim_wm_defaulthotkey = 1
			endif
		endif
endif
