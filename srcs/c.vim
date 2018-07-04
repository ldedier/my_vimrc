function Skeleton_h()
	execute "StdHead2"
	let ok = @f
	let maj_def = join(split(toupper(@f), '\.'), '_')
	put ='#ifndef '. maj_def
	put ='# define '. maj_def
	execute "normal! o#endif\<up>\<esc>o\<cr>"
	execute "startinsert"
endfunction

function Skeleton_c()
	execute "StdHead2"
endfunction

function Main_c()
	execute "r " . @t . "main.c"
	execute "normal! \<down>\<down>\<down>o\<cr>"
	execute "startinsert"
	execute "normal! i\<tab>"
endfunction

function Include_perso_c()
	execute "normal! i#include \"\.h\"\<left>\<left>"
	execute "startinsert"
endfunction

function Include_sys_c()
	execute "normal! i#include \<\.h\>\<left>\<left>"
	execute "startinsert"
endfunction
