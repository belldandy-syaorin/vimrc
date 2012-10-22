if has('python')
	nnoremap <F5> :GundoToggle<CR>
	let g:gundo_width = 20
	let g:gundo_right = 1
	let g:gundo_preview_height = 10
	let g:gundo_preview_bottom = 1
	let g:gundo_close_on_revert = 1
endif

nnoremap <F6> :NERDTreeToggle<CR>
let NERDTreeWinSize = 20
