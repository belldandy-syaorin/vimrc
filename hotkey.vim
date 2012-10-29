if v:version >= 703 && has('python')
	nnoremap <F5> :GundoToggle<CR>
endif
nnoremap <S-F5> :FufCoverageFile!<CR>

nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <S-F6> :NERDTree<Space>

nnoremap <F7> :FufFile!<CR>
nnoremap <S-F7> :FufDir!<CR>
