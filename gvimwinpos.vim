if has('python')
	nnoremap <F2> :python import sys<CR>:python sys.argv = ["smart"]<CR>:execute 'pyfile ' . '$VIM/gvimwinpos.py'<CR>:execute 'winpos ' . g:gvimwinpos_x g:gvimwinpos_y<CR>:echo "gvimwinpos_mode =" gvimwinpos_mode<CR>
	nnoremap <F3> :python import sys<CR>:python sys.argv = ["normal"]<CR>:execute 'pyfile ' . '$VIM/gvimwinpos.py'<CR>:execute 'winpos ' . g:gvimwinpos_x g:gvimwinpos_y<CR>:echo "gvimwinpos_mode =" gvimwinpos_mode<CR>
endif
