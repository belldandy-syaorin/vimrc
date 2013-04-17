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

"neocomplcache
	let g:neocomplcache_enable_at_startup = 1

"vim-fuzzyfinder
	nnoremap <F5> :FufFile!<CR>
	nnoremap <F6> :FufDir!<CR>
	nnoremap <F7> :FufCoverageFile!<CR>
endif
