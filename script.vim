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

"YouCompleteMe > clang_complete > neocomplcache
	if filereadable(expand('$VIM/vimfiles/bundle/YouCompleteMe/python/ycm_core.pyd')) ||
	 \ filereadable(expand('~/.vim/bundle/YouCompleteMe/python/ycm_core.so'))
	elseif filereadable(expand('$VIM/vimfiles/bundle/clang_complete/plugin/clang_complete.vim')) ||
	     \ filereadable(expand('~/.vim/bundle/clang_complete/plugin/clang_complete.vim'))
		if has('win32') || has('win64')
			let g:clang_library_path = "C:/dev/llvm_build/bin/Release"
		endif
	elseif filereadable(expand('$VIM/vimfiles/bundle/neocomplcache/plugin/neocomplcache.vim')) ||
	     \ filereadable(expand('~/.vim/bundle/neocomplcache/plugin/neocomplcache.vim'))
		let g:neocomplcache_enable_at_startup = 1
	endif

"vim-fuzzyfinder
	nnoremap <F5> :FufFile!<CR>
	nnoremap <F6> :FufDir!<CR>
	nnoremap <F7> :FufCoverageFile!<CR>
endif
