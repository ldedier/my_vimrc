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
	execute "normal! i#include \"\""
	execute "startinsert"
endfunction

function Include_sys()
	execute "normal! i#include \<\>"
	execute "startinsert"
endfunction
map <c-m> : call Main_c()<CR>
map <c-i> : call Include_perso()<CR>
map <s-i> : call Include_sys()<CR>
