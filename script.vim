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

"YouCompleteMe > clang_complete + neocomplcache
	if filereadable(expand(
	 \ '$VIM/vimfiles/bundle/YouCompleteMe/python/ycm_core.pyd'))
	 \ ||
	 \ filereadable(expand(
	 \ '~/.vim/bundle/YouCompleteMe/python/ycm_core.so'))
	else
		let g:neocomplcache_enable_at_startup = 1
		if !exists('g:neocomplcache_force_omni_patterns')
			let g:neocomplcache_force_omni_patterns = {}
		endif
		let g:neocomplcache_force_overwrite_completefunc = 1
		let g:clang_complete_auto = 0
		let g:neocomplcache_force_omni_patterns.c =
		  \ '[^.[:digit:] *\t]\%(\.\|->\)'
		let g:neocomplcache_force_omni_patterns.cpp =
		  \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
		let g:neocomplcache_force_omni_patterns.objc =
		  \ '[^.[:digit:] *\t]\%(\.\|->\)'
		let g:neocomplcache_force_omni_patterns.objcpp =
		  \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
		if has('win32') || has('win64')
			let g:clang_library_path =
			  \ "C:/dev/llvm_build/bin/Release"
		endif
	endif

"vim-fuzzyfinder
	nnoremap <F5> :FufFile!<CR>
	nnoremap <F6> :FufDir!<CR>
	nnoremap <F7> :FufCoverageFile!<CR>
endif
