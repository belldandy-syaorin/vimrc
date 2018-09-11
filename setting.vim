set nocompatible
if filereadable(expand('$VIMRUNTIME/autoload/pathogen.vim')) ||
 \ filereadable(expand('$VIM/vimfiles/autoload/pathogen.vim'))
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
set foldcolumn=1
set foldmethod=indent
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>-,eol:<,trail:-
set relativenumber
set showcmd
set smartcase
set smartindent
set splitbelow
set splitright
set noswapfile
set nowritebackup
syntax enable
autocmd InsertEnter *
\ set cursorcolumn nocursorline number norelativenumber colorcolumn=40,80,120,160
autocmd InsertLeave *
\ set nocursorcolumn cursorline nonumber relativenumber colorcolumn=
if has('unix')
	set clipboard=unnamedplus
	if has('gui_running')
		set guifont=Source\ Code\ Pro\ Light\ 14
		function! s:CJK_Font(mode)
			if a:mode == 0
				set guifontwide=Noto\ Sans\ CJK\ TW\ Light\ 16
			elseif a:mode == 1
				set guifontwide=Noto\ Sans\ CJK\ CN\ Light\ 16
			elseif a:mode == 2
				set guifontwide=Noto\ Sans\ CJK\ JP\ Light\ 16
			elseif a:mode == 3
				set guifontwide=Noto\ Sans\ CJK\ KR\ Light\ 16
			endif
		endfunction
		cmap <A-,> %!perl -e 'print sort <>'
		cmap <A-.> %!python -c 'import sys ; sys.stdout.writelines(sorted(sys.stdin.readlines()))'
		cmap <A-/> %!sort -k 2
	endif
elseif has('win32') || has('win64')
	set clipboard=unnamed
	set shellcmdflag=/u/c
	if has('gui_running')
		autocmd GUIEnter * winpos 0 0
		autocmd InsertEnter * set noimdisable
		autocmd InsertLeave * set imdisable
		set guifont=Source_Code_Pro_Light:h14
		function! s:CJK_Font(mode)
			if a:mode == 0
				set guifontwide=MingLiU:h17
			elseif a:mode == 1
				set guifontwide=
			elseif a:mode == 2
				set guifontwide=
			elseif a:mode == 3
				set guifontwide=
			endif
		endfunction
		cmap <A-,> %!perl -e "print sort <>"
		cmap <A-.> %!python -c "import sys ; sys.stdout.writelines(sorted(sys.stdin.readlines()))"
	endif
endif
if has('gui_running')
	call <SID>CJK_Font(0)
	function! s:Highlight_From_File_Path(mode)
		let s:highlightfromfilepath = substitute(expand('%'), expand('%:t'), 'highlight.vim', 'g')
		if a:mode == 0 && filereadable(s:highlightfromfilepath)
			syntax clear
			echo 'Highlight From File Path = Disable'
		elseif a:mode == 1 && filereadable(s:highlightfromfilepath)
			if has('unix')
				let s:highlightfromfilepath = substitute(substitute(expand('%'), expand('%:t'), 'highlight.vim', 'g'), '\ ', '\\\ ', 'g')
				execute 'source ' s:highlightfromfilepath
			elseif has('win32') || has('win64')
				execute 'source ' s:highlightfromfilepath
			endif
			if g:highlight_file_path_advanced == 0
				echo 'Highlight From File Path = Enable'
			elseif g:highlight_file_path_advanced == 1
				echo 'Highlight From File Path = Enable (Advanced)'
			endif
		else
			echo 'Highlight From File Path = n/a'
		endif
	endfunction
	function! s:Highlight_From_File_Path_Select()
		if !exists("s:highlight_file_path_select") && !exists("g:highlight_file_path_advanced")
			let s:highlight_file_path_select = 1
			let g:highlight_file_path_advanced = 0
		endif
		if s:highlight_file_path_select == 0
			call <SID>Highlight_From_File_Path(0)
			let s:highlight_file_path_select = 1
		elseif s:highlight_file_path_select == 1
			call <SID>Highlight_From_File_Path(1)
			let s:highlight_file_path_select = 2
			let g:highlight_file_path_advanced = 1
		elseif s:highlight_file_path_select == 2
			call <SID>Highlight_From_File_Path(1)
			let s:highlight_file_path_select = 0
			let g:highlight_file_path_advanced = 0
		endif
	endfunction
	nmap <F3> :call <SID>Highlight_From_File_Path_Select()<CR>
	function! s:CJK_Font_Select()
		if !exists("s:cjk_font_select")
			let s:cjk_font_select = 1
		endif
		if s:cjk_font_select == 0
			call <SID>CJK_Font(0)
			let s:cjk_font_select = 1
		elseif s:cjk_font_select == 1
			call <SID>CJK_Font(1)
			let s:cjk_font_select = 2
		elseif s:cjk_font_select == 2
			call <SID>CJK_Font(2)
			let s:cjk_font_select = 3
		elseif s:cjk_font_select == 3
			call <SID>CJK_Font(3)
			let s:cjk_font_select = 0
		endif
	endfunction
	nmap <F4> :call <SID>CJK_Font_Select()<CR>:echo 'guifontwide ='&guifontwide<CR>
	highlight Normal guibg=black guifg=white
	highlight User1 guibg=white guifg=red
	highlight User2 guibg=white guifg=green
	highlight User3 guibg=white guifg=blue
	set guioptions-=e
	set guioptions-=m
	set guioptions-=T
	set statusline=[%1*%t%*]
	set statusline+=[%2*%{&fileencoding}%*(%2*%{&bomb}%*)%2*%{&fileformat}%*]
	set statusline+=[%3*%M%R%Y%*]
	set statusline+=%=
	set statusline+=[%1*%{mode()}%*]
	set statusline+=[%1*%{get(undotree(),'seq_cur')}%*/%1*%{get(undotree(),'seq_last')}%*]
	set statusline+=[%2*%{&encoding}%*]
	set statusline+=[%3*%l%*,%3*%c%*/%3*%L%*]
else
	set statusline=[%t]
	set statusline+=[%{&fileencoding}(%{&bomb})%{&fileformat}]
	set statusline+=[%M%R%Y]
	set statusline+=%=
	set statusline+=[%{mode()}]
	set statusline+=[%{get(undotree(),'seq_cur')}/%{get(undotree(),'seq_last')}]
	set statusline+=[%{&encoding}]
	set statusline+=[%l,%c/%L]
endif
map! <A-h> <Left>
map! <A-l> <Right>
map! <A-j> <Down>
map! <A-k> <Up>
if v:version >= 800
	set cryptmethod=blowfish2
elseif v:version >= 704 && has('patch401')
	set cryptmethod=blowfish2
endif
" loadplugins
if (&loadplugins == 1) && s:use_pathogen == 1 && s:use_root == 0
	" ctrlp.vim
		let g:ctrlp_types = ['buf', 'mru', 'fil']
	" neocomplete.vim
		let g:neocomplete#enable_at_startup = 1
		let g:neocomplete#enable_smart_case = 1
	" nerdtree
		let NERDTreeQuitOnOpen = 1
	" signify
		let g:signify_disable_by_default = 1
		let g:signify_line_highlight = 1
		let g:signify_vcs_list = [ 'git', 'hg' ]
		nmap <expr> <A-h> &diff ? "gg]c[c" : "gg<A-j><A-k>"
		nmap <expr> <A-l> &diff ? "G[c]c" : "G<A-k><A-j>"
		nmap <expr> <A-j> &diff ? "]c" : "<Plug>(signify-next-hunk)"
		nmap <expr> <A-k> &diff ? "[c" : "<Plug>(signify-prev-hunk)"
	" syntastic
		let g:syntastic_always_populate_loc_list = 1
		let g:syntastic_auto_loc_list = 1
		let g:syntastic_check_on_wq = 0
	" vim-diff-enhanced
		let &diffexpr = 'EnhancedDiff#Diff("git diff", "--diff-algorithm=histogram")'
	if has('gui_running')
		" nerdtree
			nmap <F7> :NERDTreeToggle<CR>
		" signify
			nmap <F5> :SignifyToggle<CR>
		" syntastic
			set statusline+=%1*%{SyntasticStatuslineFlag()}%*
			nmap <F9> :SyntasticCheck<CR>
			nmap <F10> :SyntasticReset<CR>
		" vcscommand
			nmap <F6> :VCSDiff<CR>
	else
		" syntastic
			set statusline+=%{SyntasticStatuslineFlag()}
	endif
endif
