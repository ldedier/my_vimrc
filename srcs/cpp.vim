function Include_perso_cpp()
	execute "normal! i#include \"\.hpp\"\<left>\<left>\<left>\<left>"
	execute "startinsert"
endfunction

function Include_sys_cpp()
	execute "normal! i#include \<\>\<left>"
	execute "startinsert"
endfunction

function PutClass()
	let name = split(@%, '\.')[0]
	put ='class '. name
	execute "normal! o{"
	execute "normal! opublic:"
	execute "normal! o" . name . "();"
	execute "normal! o~" . name . "();"
	execute "normal! oprivate:"
	execute "normal! o};\<esc>\<up>o\<tab>"
endfunction

function Skeleton_hpp_class()
	"execute "StdHead2"
	let maj_def = join(split(toupper(@%), '\.'), '_')
	put ='#ifndef ' . maj_def
	put ='# define ' . maj_def
	execute "normal! o#endif\<up>\<esc>o"
	call PutClass()
	execute "startinsert"
endfunction

function Add_cpp_func_by_prototype()
	let str = @0
	let str = substitute(str, '	', '', 'g')
	execute "normal! o" . str
endfunction

function Skeleton_cpp_class()
	"execute "StdHead2"
	let name = split(@%, '\.')[0]
	let start = line(".")
	execute "normal! o#include \"" . name . ".hpp\""
	execute "vsplit " . name . ".hpp"
	silent! execute "/.*(.*).*;"
	let first = line(".")
	if first == 1
		q!
		return
	endif
	execute "normal! yy\<C-W>\<C-W>"
	call Add_cpp_func_by_prototype()
	execute "normal! \<C-W>\<C-W>n"
	while line(".") != first
		execute "normal! yy\<C-W>\<C-W>"
		call Add_cpp_func_by_prototype()
		execute "normal! \<C-W>\<C-W>n"
	endwhile
	q
endfunction

function Skeleton_cpp()
endfunction
