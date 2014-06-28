if has('python')
	python import sys
	function! Vim_Py()
		execute 'pyfile ' . 'C:/repository/git/vimrc/vim_pos+size.py'
	endfunction
	function! Vim_Pos(mode)
		if a:mode == 0
			python sys.argv = ["normal"]
		elseif a:mode == 1
			python sys.argv = ["smart"]
		endif
		call Vim_Py()
	endfunction
	function! Vim_Size(mode)
		if a:mode == 0
			python sys.argv = ["big"]
		elseif a:mode == 1
			python sys.argv = ["large"]
		elseif a:mode == 2
			python sys.argv = ["default"]
		endif
		call Vim_Py()
	endfunction
	function! Vim_Top(mode)
		if a:mode == 0
			python sys.argv = ["untop"]
		elseif a:mode == 1
			python sys.argv = ["top"]
		endif
		call Vim_Py()
	endfunction
	function! Vim_Move(mode)
		if a:mode == 1
			python sys.argv = ["position1"]
		elseif a:mode == 2
			python sys.argv = ["position2"]
		elseif a:mode == 3
			python sys.argv = ["position3"]
		elseif a:mode == 4
			python sys.argv = ["position4"]
		elseif a:mode == 5
			python sys.argv = ["position5"]
		elseif a:mode == 6
			python sys.argv = ["position6"]
		elseif a:mode == 7
			python sys.argv = ["position7"]
		elseif a:mode == 8
			python sys.argv = ["position8"]
		elseif a:mode == 9
			python sys.argv = ["position9"]
		endif
		call Vim_Py()
	endfunction
	nnoremap <F4> :call Vim_Pos(0)<CR>
	nnoremap <S-F4> :call Vim_Pos(1)<CR>
	nnoremap <C-F4> :call Vim_Move()
	nnoremap <F5> :call Vim_Size(0)<CR>
	nnoremap <S-F5> :call Vim_Size(1)<CR>
	nnoremap <C-F5> :call Vim_Size(2)<CR>
	nnoremap <F6> :call Vim_Top(0)<CR>
	nnoremap <S-F6> :call Vim_Top(1)<CR>
endif
