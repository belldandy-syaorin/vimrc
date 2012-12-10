"gundo.vim
	if v:version >= 703 && has('python')
		nnoremap <F5> :GundoToggle<CR>
		let g:gundo_close_on_revert = 1
		let g:gundo_preview_bottom = 1
		let g:gundo_preview_height = 10
		let g:gundo_right = 1
		let g:gundo_width = 20
	endif

"nerdtree
	nnoremap <F6> :NERDTreeToggle<CR>
	nnoremap <S-F6> :NERDTree<Space>
	let NERDTreeCaseSensitiveSort = 1
	let NERDTreeChDirMode = 2
	let NERDTreeMinimalUI = 1
	let NERDTreeShowHidden = 1
	let NERDTreeWinSize = 20

"vim-fuzzyfinder
	nnoremap <S-F5> :FufCoverageFile!<CR>
	nnoremap <F7> :FufFile!<CR>
	nnoremap <S-F7> :FufDir!<CR>

"vim-indent-guides
	let g:indent_guides_enable_on_vim_startup = 1
