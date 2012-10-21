if has('gui_running')
	if has('win32') || has('win64')
		nnoremap <C-F5> :set guifont=Source_Code_Pro_Light:h14<CR>
		nnoremap <C-F6> :set guifont=MingLiU:h14<CR>
	elseif has('unix')
		nnoremap <C-F5> :set guifont=Source\ Code\ Pro\ Light\ 14<CR>
		nnoremap <C-F6> :set guifont=WenQuanYi\ Zen\ Hei\ Mono\ 14<CR>
	endif
endif
