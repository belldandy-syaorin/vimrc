if has('python')
	python import sys
	function! GvimWinPos(mode)
		if a:mode == 0
			python sys.argv = ["normal"]
		elseif a:mode == 1
			python sys.argv = ["smart"]
		endif
		execute 'pyfile ' . '$VIM/gvimwinpos.py'
		execute 'winpos ' . g:gvimwinpos_x g:gvimwinpos_y
		echo "gvimwinpos_mode =" g:gvimwinpos_mode
	endfunction
	function! GvimWinSize(mode)
		if a:mode == 0
			python sys.argv = ["big"]
		elseif a:mode == 1
			python sys.argv = ["large"]
		endif
		execute 'pyfile ' . '$VIM/gvimwinpos.py'
		echo "gvimwinsize_mode =" g:gvimwinsize_x g:gvimwinsize_y
	endfunction
	nnoremap <F3> :call GvimWinPos(0)<CR>
	nnoremap <S-F3> :call GvimWinPos(1)<CR>
	nnoremap <F2> :call GvimWinSize(0)<CR>
	nnoremap <S-F2> :call GvimWinSize(1)<CR>
endif
