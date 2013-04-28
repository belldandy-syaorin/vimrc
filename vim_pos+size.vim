if has('python')
	python import sys
	function! Vim_Pos(mode)
		if a:mode == 0
			python sys.argv = ["normal"]
		elseif a:mode == 1
			python sys.argv = ["smart"]
		endif
		execute 'pyfile ' . '$VIM/vim_pos+size.py'
		echo "vim_pos_mode =" g:vim_pos_mode
	endfunction
	function! Vim_Size(mode)
		if a:mode == 0
			python sys.argv = ["big"]
		elseif a:mode == 1
			python sys.argv = ["large"]
		endif
		execute 'pyfile ' . '$VIM/vim_pos+size.py'
		echo "vim_size_mode =" g:vim_size_x g:vim_size_y
	endfunction
	function! Vim_Top(mode)
		if a:mode == 0
			python sys.argv = ["top"]
		elseif a:mode == 1
			python sys.argv = ["untop"]
		endif
		execute 'pyfile ' . '$VIM/vim_pos+size.py'
	endfunction
	nnoremap <F3> :call Vim_Pos(0)<CR>
	nnoremap <S-F3> :call Vim_Pos(1)<CR>
	nnoremap <F2> :call Vim_Size(0)<CR>
	nnoremap <S-F2> :call Vim_Size(1)<CR>
	nnoremap <C-F2> :set columns=80<CR>:set lines=25<CR>:winpos 0 0<CR>:echo "vim_size_mode = default"<CR>
	nnoremap <S-F4> :call Vim_Top(0)<CR>:echo "vim_top_mode = Enable"<CR>
	nnoremap <C-F4> :call Vim_Top(1)<CR>:echo "vim_top_mode = Disable"<CR>
endif
