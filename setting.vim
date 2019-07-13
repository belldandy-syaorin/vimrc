" vi
set nocompatible

" vim-pathogen
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

" vim
set ambiwidth=double
set autoindent
set autoread
set backspace=indent,eol,start
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
\ set cursorcolumn cursorline number norelativenumber colorcolumn=40,80,120,160
autocmd InsertLeave *
\ set nocursorcolumn nocursorline nonumber relativenumber colorcolumn=
if has('unix')
	set clipboard=unnamedplus
	if has('gui_running')
		set guifont=Source\ Code\ Pro\ Light\ 14
	endif
elseif has('win32') || has('win64')
	set clipboard=unnamed
	set shellcmdflag=/u/c
	if has('gui_running')
		autocmd GUIEnter * winpos 0 0
		autocmd InsertEnter * set noimdisable
		autocmd InsertLeave * set imdisable
		set guifont=Source_Code_Pro_Light:h14
	endif
endif
if v:version >= 800
	set cryptmethod=blowfish2
elseif v:version >= 704 && has('patch401')
	set cryptmethod=blowfish2
endif
if has('gui_running')
	map! <A-h> <Left>
	map! <A-l> <Right>
	map! <A-j> <Down>
	map! <A-k> <Up>
	nmap <expr> <A-d> &diff ? ":diffoff<CR>" : ":diffthis<CR>"
	nmap <A-e> <C-w>=
	nmap <A-m> <C-w>_
	nmap <A-w> :set wrap!<CR>
	highlight Normal guibg=black guifg=white
	highlight User1 guibg=white guifg=red
	highlight User2 guibg=white guifg=green
	highlight User3 guibg=white guifg=blue
	set guioptions-=e
	set guioptions-=m
	set guioptions-=T
	set statusline=[%1*%t%*@%1*%{bufnr('%')}%*]
	set statusline+=[%2*%{&fileencoding}%*(%2*%{&bomb}%*)%2*%{&fileformat}%*]
	set statusline+=[%3*%M%R%Y%*]
	set statusline+=%=
	set statusline+=[%1*%{mode()}%*]
	set statusline+=[%1*%{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))}%*]
	set statusline+=[%1*%{get(undotree(),'seq_cur')}%*/%1*%{get(undotree(),'seq_last')}%*]
	set statusline+=[%2*%{&encoding}%*]
	set statusline+=[%2*%B%*]
	set statusline+=[%3*%l%*,%3*%c%*@%3*%L%*]
else
	set statusline=[%t@%{bufnr('%')}]
	set statusline+=[%{&fileencoding}(%{&bomb})%{&fileformat}]
	set statusline+=[%M%R%Y]
	set statusline+=%=
	set statusline+=[%{mode()}]
	set statusline+=[%{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))}]
	set statusline+=[%{get(undotree(),'seq_cur')}/%{get(undotree(),'seq_last')}]
	set statusline+=[%{&encoding}]
	set statusline+=[%B]
	set statusline+=[%l,%c@%L]
endif

" CJK_Font
if has('gui_running')
	if has('unix')
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
	elseif has('win32') || has('win64')
		function! s:CJK_Font(mode)
			if a:mode == 0
				set guifontwide=MingLiU:h17
			elseif a:mode == 1
				set guifontwide=MingLiU:h16
			elseif a:mode == 2
				set guifontwide=MingLiU:h15
			elseif a:mode == 3
				set guifontwide=MingLiU:h14
			endif
		endfunction
	endif
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
	nmap <A-f> :call <SID>CJK_Font_Select()<CR>:echo 'guifontwide ='&guifontwide<CR>
	call <SID>CJK_Font(0)
endif

" Highlight_From_File_Path
	function! s:Highlight_From_File_Path(mode)
		if has('unix')
			let s:highlightfromfilepath = substitute(substitute(expand('%'), expand('%:t'), 'highlight.vim', 'g'), '\ ', '\\\ ', 'g')
		elseif has('win32') || has('win64')
			let s:highlightfromfilepath = substitute(expand('%'), expand('%:t'), 'highlight.vim', 'g')
		endif
		if a:mode == 0 && filereadable(s:highlightfromfilepath)
			syntax clear
			echo 'Highlight From File Path = Disable'
		elseif a:mode == 1 && filereadable(s:highlightfromfilepath)
			syntax clear
			execute 'source ' s:highlightfromfilepath
			if g:highlight_file_path_group == 0
				echo 'Highlight From File Path = Enable (group 0)'
			elseif g:highlight_file_path_group == 1
				echo 'Highlight From File Path = Enable (group 0+1)'
			elseif g:highlight_file_path_group == 2
				echo 'Highlight From File Path = Enable (group 0+2)'
			endif
		else
			echo 'Highlight From File Path = n/a'
		endif
	endfunction
	function! s:Highlight_From_File_Path_Select()
		if !exists("s:highlight_file_path_select") && !exists("g:highlight_file_path_group")
			let s:highlight_file_path_select = 1
			let g:highlight_file_path_group = 0
		endif
		if s:highlight_file_path_select == 0
			call <SID>Highlight_From_File_Path(0)
			let s:highlight_file_path_select = 1
		elseif s:highlight_file_path_select == 1
			call <SID>Highlight_From_File_Path(1)
			let s:highlight_file_path_select = 2
			let g:highlight_file_path_group = 1
		elseif s:highlight_file_path_select == 2
			call <SID>Highlight_From_File_Path(1)
			let s:highlight_file_path_select = 3
			let g:highlight_file_path_group = 2
		elseif s:highlight_file_path_select == 3
			call <SID>Highlight_From_File_Path(1)
			let s:highlight_file_path_select = 0
			let g:highlight_file_path_group = 0
		endif
	endfunction
	nmap <A-g> :call <SID>Highlight_From_File_Path_Select()<CR>

" sort
if has('gui_running')
	if has('unix')
		nmap <A-,> :%!perl -e 'print sort <>'<CR>:echo 'sort (perl)'<CR>
		nmap <A-.> :%!python -c 'import sys ; sys.stdout.writelines(sorted(sys.stdin.readlines()))'<CR>:echo 'sort (python)'<CR>
		nmap <A-/> :%!sort -k 2<CR>:echo 'sort (sort -k 2)'<CR>
		nmap <A-<> :%!perl -e 'print reverse <>'<CR>:echo 'sort reverse (perl)'<CR>
		nmap <A->> :%!python -c 'import sys ; sys.stdout.writelines(sorted(sys.stdin.readlines(), reverse=True))'<CR>:echo 'sort reverse (python)'<CR>
		nmap <A-?> :%!sort -k 2 -r<CR>:echo 'sort reverse (sort -k 2 -r)'<CR>
	elseif has('win32') || has('win64')
		nmap <A-,> :%!perl -e "print sort <>"<CR>:echo "sort (perl)"<CR>
		nmap <A-.> :%!python -c "import sys ; sys.stdout.writelines(sorted(sys.stdin.readlines()))"<CR>:echo "sort (python)"<CR>
		nmap <A-<> :%!perl -e "print reverse <>"<CR>:echo "sort reverse (perl)"<CR>
		nmap <A->> :%!python -c "import sys ; sys.stdout.writelines(sorted(sys.stdin.readlines(), reverse=True))"<CR>:echo "sort reverse (python)"<CR>
	endif
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
	" syntastic
		let g:syntastic_always_populate_loc_list = 1
		let g:syntastic_auto_loc_list = 1
		let g:syntastic_check_on_wq = 0
	" vim-diff-enhanced
		let &diffexpr = 'EnhancedDiff#Diff("git diff", "--diff-algorithm=histogram")'
	" vim-searchindex
		nmap n nzz<Plug>SearchIndex
		nmap N Nzz<Plug>SearchIndex
	" vim-signify
		let g:signify_disable_by_default = 1
		let g:signify_line_highlight = 1
		let g:signify_vcs_list = [ 'git', 'hg' ]
		nmap <expr> <A-h> &diff ? "gg]c[c" : "gg<Plug>(signify-next-hunk)<Plug>(signify-prev-hunk)"
		nmap <expr> <A-l> &diff ? "G[c]c" : "G<Plug>(signify-prev-hunk)<Plug>(signify-next-hunk)"
		nmap <expr> <A-j> &diff ? "]czz" : "<Plug>(signify-next-hunk)zz"
		nmap <expr> <A-k> &diff ? "[czz" : "<Plug>(signify-prev-hunk)zz"
	if has('gui_running')
		" nerdtree
			nmap <A-n> :NERDTreeToggle<CR>
		" syntastic
			set statusline+=%1*%{SyntasticStatuslineFlag()}%*
			nmap <A-c> :SyntasticCheck<CR>
			nmap <A-r> :SyntasticReset<CR>
		" vcscommand
			nmap <A-v> :VCSDiff<CR>
		" vim-signify
			nmap <expr> <A-s> &diff ? ":diffoff<CR>" : ":SignifyToggle<CR>"
	else
		" syntastic
			set statusline+=%{SyntasticStatuslineFlag()}
	endif
else
	nmap n nzz
	nmap N Nzz
	nmap <A-h> gg]c[c
	nmap <A-l> G[c]c
	nmap <A-j> ]czz
	nmap <A-k> [czz
endif
