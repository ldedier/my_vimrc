
function Include_perso_cpp()
	execute "normal! i#include \"\.hpp\"\<left>\<left>\<left>\<left>"
	execute "startinsert"
endfunction

function Include_sys_cpp()
	execute "normal! i#include \<\>\<left>"
	execute "startinsert"
endfunction

function PutClass()
	let name = split(@f, '\.')[0]
	put ='class '. name
	execute "normal! o{"
	execute "normal! opublic:"
	execute "normal! o" . name . "();"
	execute "normal! o~" . name . "();"
	execute "normal! oprivate:"
	execute "normal! o};\<esc>\<up>o\<tab>"

endfunction

function Skeleton_hpp_class()
	execute "StdHead2"
	let maj_def = join(split(toupper(@f), '\.'), '_')
	put ='#ifndef ' . maj_def
	put ='# define ' . maj_def

	execute "normal! o#endif\<up>\<esc>o"
	call PutClass()
	execute "startinsert"
endfunction

function Skeleton_cpp_class()
endfunction

function Skeleton_cpp()
endfunction
