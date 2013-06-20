if (&loadplugins == 1)
"gundo.vim
	if v:version >= 703 && has('python')
		nnoremap <F4> :GundoToggle<CR>
		let g:gundo_close_on_revert = 1
		let g:gundo_preview_bottom = 1
		let g:gundo_preview_height = 10
		let g:gundo_right = 1
		let g:gundo_width = 20
	endif

"YouCompleteMe > neocomplcache + clang_complete + jedi-vim
	if filereadable(expand(
	 \ '$VIM/vimfiles/bundle/YouCompleteMe/python/ycm_core.pyd'))
	 \ ||
	 \ filereadable(expand(
	 \ '~/.vim/bundle/YouCompleteMe/python/ycm_core.so'))
		if has('win32') || has('win64')
			let g:ycm_global_ycm_extra_conf =
			  \ '$VIM/vimfiles/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
		elseif has('unix')
			let g:ycm_global_ycm_extra_conf =
			  \ '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
		endif
		let g:ycm_autoclose_preview_window_after_completion = 1
		let g:ycm_autoclose_preview_window_after_insertion = 1
	else
		let g:neocomplcache_enable_at_startup = 1
		if !exists('g:neocomplcache_force_omni_patterns')
			let g:neocomplcache_force_omni_patterns = {}
		endif
		let g:neocomplcache_force_overwrite_completefunc = 1
		let g:neocomplcache_force_omni_patterns.c =
		  \ '[^.[:digit:] *\t]\%(\.\|->\)'
		let g:neocomplcache_force_omni_patterns.cpp =
		  \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
		let g:neocomplcache_force_omni_patterns.objc =
		  \ '[^.[:digit:] *\t]\%(\.\|->\)'
		let g:neocomplcache_force_omni_patterns.objcpp =
		  \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
		let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
		let g:clang_complete_auto = 0
		if has('win32') || has('win64')
			if filereadable(expand(
			 \ 'C:/clang/bin/libclang.dll'))
				let g:clang_library_path =
				  \ "C:/clang/bin"
			endif
		elseif has('unix')
			if filereadable(expand(
			 \ '/usr/local/lib/libclang.so'))
				let g:clang_library_path =
				  \ "/usr/local/lib"
			endif
		let g:jedi#popup_on_dot = 0
		autocmd FileType python setlocal omnifunc=jedi#complete
		endif
	endif

"vim-fuzzyfinder
	nnoremap <F5> :FufFile!<CR>
	nnoremap <F6> :FufDir!<CR>
	nnoremap <F7> :FufCoverageFile!<CR>
endif
