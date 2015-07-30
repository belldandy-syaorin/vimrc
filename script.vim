" loadplugins
if (&loadplugins == 1)
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
			nnoremap <S-F2> :VCSVimDiff<CR>
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
