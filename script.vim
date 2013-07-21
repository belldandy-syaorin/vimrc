if (&loadplugins == 1)
"neocomplcache + clang_complete + jedi-vim
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
	endif
	let g:jedi#popup_on_dot = 0
	autocmd FileType python setlocal omnifunc=jedi#complete
endif
