if has('python')
	python import sys
	function! GvimWinPos(mode)
		if a:mode == 1
			python sys.argv = ["smart"]
		elseif a:mode == 0
			python sys.argv = ["normal"]
		endif
		execute 'pyfile ' . '$VIM/gvimwinpos.py'
		execute 'winpos ' . g:gvimwinpos_x g:gvimwinpos_y
		echo "gvimwinpos_mode =" g:gvimwinpos_mode
	endfunction
	nnoremap <F2> :call GvimWinPos(1)<CR>
	nnoremap <F3> :call GvimWinPos(0)<CR>
endif
