function Skeleton_h()
	execute "StdHead2"
endfunction

function Skeleton_c()
	execute "StdHead2"
endfunction

function Main_c()
	execute "r " . @b . "/templates/main.c"
	execute "normal! \<down>\<down>\<down>o\<cr>"
	execute "startinsert"
	execute "normal! i\<tab>"
endfunction

function Include_perso()
	execute "normal! i#include \"\.h\"\<left>\<left>"
	execute "startinsert"
endfunction

function Include_sys()
	execute "normal! i#include \<\.h\>\<left>\<left>"
	execute "startinsert"
endfunction
