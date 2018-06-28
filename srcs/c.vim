function Skeleton_h()
	execute "StdHead2"
endfunction

function Skeleton_c()
	execute "StdHead2"
endfunction

function Main_c()
	execute "r " . @b . "/templates/main.c"
endfunction

function Include_perso()
	execute "normal! i#include \"\<right>\""
	execute "startinsert"
endfunction

function Include_sys()
	execute "normal! i#include \<\>"
	execute "startinsert"
endfunction

nnoremap <c-m> :call Main_c()<CR>
nnoremap <c-i> :call Include_perso()<CR>
nnoremap <s-i> :call Include_sys()<CR>

inoremap <c-i> if ()<left>
inoremap <c-e> else if ()<left>
inoremap <c-r> return ();<left><left>
