if has('gui_running')
	if has('win32') || has('win64')
		set guifont=Source_Code_Pro_Light:h14
		set guifontwide=MingLiU:h17
		nnoremap <C-F5> :set guifontwide=MingLiU:h17<CR>
		nnoremap <C-F6> :set guifontwide=Migu_1M:h17<CR>
	elseif has('unix')
		set guifont=Source\ Code\ Pro\ Light\ 14
		set guifontwide=WenQuanYi\ Zen\ Hei\ Mono\ 17
	endif
endif
