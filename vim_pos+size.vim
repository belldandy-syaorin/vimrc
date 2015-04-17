if has('python')
	python import sys
	let s:vim_pyfilepath = expand('<sfile>:r') . '.py'
	function! Vim_Py()
		execute 'pyfile ' s:vim_pyfilepath
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
	function! Vim_Size_Select()
		if !exists("s:vim_size_select")
			let s:vim_size_select = 0
		endif
		if s:vim_size_select == 0
			call Vim_Size(0)
			let s:vim_size_select = 1
		elseif s:vim_size_select == 1
			call Vim_Size(1)
			let s:vim_size_select = 2
		elseif s:vim_size_select == 2
			call Vim_Size(2)
			let s:vim_size_select = 0
		endif
	endfunction
	function! Vim_Top(mode)
		if a:mode == 0
			python sys.argv = ["untop"]
		elseif a:mode == 1
			python sys.argv = ["top"]
		endif
		call Vim_Py()
	endfunction
	function! Vim_Top_Select()
		if !exists("s:vim_top_select")
			let s:vim_top_select = 1
		endif
		if s:vim_top_select == 0
			call Vim_Top(0)
			let s:vim_top_select = 1
		elseif s:vim_top_select == 1
			call Vim_Top(1)
			let s:vim_top_select = 0
		endif
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
	nnoremap <F3> :call Vim_Pos(0)<CR>
	nnoremap <F4> :call Vim_Pos(1)<CR>
	nnoremap <S-F4> :call Vim_Move()
	nnoremap <F5> :call Vim_Size_Select()<CR>
	nnoremap <F6> :call Vim_Top_Select()<CR>
endif
