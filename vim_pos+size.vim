if has('python')
	python import sys
	function! Vim_Pos(mode)
		if a:mode == 0
			python sys.argv = ["normal"]
		elseif a:mode == 1
			python sys.argv = ["smart"]
		endif
		execute 'pyfile ' . '$VIM/vim_pos+size.py'
	endfunction
	function! Vim_Size(mode)
		if a:mode == 0
			python sys.argv = ["big"]
		elseif a:mode == 1
			python sys.argv = ["large"]
		elseif a:mode == 2
			python sys.argv = ["default"]
		endif
		execute 'pyfile ' . '$VIM/vim_pos+size.py'
	endfunction
	function! Vim_Top(mode)
		if a:mode == 0
			python sys.argv = ["top"]
		elseif a:mode == 1
			python sys.argv = ["untop"]
		endif
		execute 'pyfile ' . '$VIM/vim_pos+size.py'
	endfunction
	function! Vim_Move(mode)
		if a:mode == 1
			python sys.argv = ["posnum1"]
		elseif a:mode == 2
			python sys.argv = ["posnum2"]
		elseif a:mode == 3
			python sys.argv = ["posnum3"]
		elseif a:mode == 4
			python sys.argv = ["posnum4"]
		elseif a:mode == 5
			python sys.argv = ["posnum5"]
		elseif a:mode == 6
			python sys.argv = ["posnum6"]
		elseif a:mode == 7
			python sys.argv = ["posnum7"]
		elseif a:mode == 8
			python sys.argv = ["posnum8"]
		elseif a:mode == 9
			python sys.argv = ["posnum9"]
		endif
		execute 'pyfile ' . '$VIM/vim_pos+size.py'
	endfunction
	nnoremap <F3> :call Vim_Pos(0)<CR>
	nnoremap <S-F3> :call Vim_Pos(1)<CR>
	nnoremap <F2> :call Vim_Size(0)<CR>
	nnoremap <S-F2> :call Vim_Size(1)<CR>
	nnoremap <S-F4> :call Vim_Size(2)<CR>
	nnoremap <S-F5> :call Vim_Top(0)<CR>
	nnoremap <S-F6> :call Vim_Top(1)<CR>
	nnoremap <C-S-F1> :call Vim_Move(1)<CR>
	nnoremap <C-S-F2> :call Vim_Move(2)<CR>
	nnoremap <C-S-F3> :call Vim_Move(3)<CR>
	nnoremap <C-S-F4> :call Vim_Move(4)<CR>
	nnoremap <C-S-F5> :call Vim_Move(5)<CR>
	nnoremap <C-S-F6> :call Vim_Move(6)<CR>
	nnoremap <C-S-F7> :call Vim_Move(7)<CR>
	nnoremap <C-S-F8> :call Vim_Move(8)<CR>
	nnoremap <C-S-F9> :call Vim_Move(9)<CR>
endif
