if (&loadplugins == 1)
" neocomplcache
	let g:neocomplcache_enable_at_startup = 1
	if !exists('g:neocomplcache_force_omni_patterns')
		let g:neocomplcache_force_omni_patterns = {}
	endif
" jedi-vim
	autocmd FileType python setlocal omnifunc=jedi#completions
	let g:jedi#auto_vim_configuration = 0
	let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
endif
