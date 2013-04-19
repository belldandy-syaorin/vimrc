nnoremap <F3> :execute 'pyfile ' . '$VIM/gvimwinpos.py'<CR>:execute 'winpos ' . g:gvimwinpos_x g:gvimwinpos_y<CR>:echo "gvimwinpos=center"<CR>
