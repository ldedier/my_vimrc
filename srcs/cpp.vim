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
	execute "normal! o\<tab>" . name . "();"
	execute "normal! o~" . name . "();"
	execute "normal! o\<bs>private:"
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

function Add_cpp_func_by_prototype(name, first)
	let str = @0
	"let str = substitute(str, '^\t*\(static\)\?', '', "gm")
	"let str = substitute(str, '^\t*\(static\)\?\t*', '', "gm")
	let str = substitute(str, '^\t*\(static\)\?\(\t\|\ \)*', '', "gm") "deleting tabs and static
	let str = substitute(str, '[A-Za-z_0-9\-~]*(.*)', a:name . '::\0', "gm") "putting Classname:: before func
	let str = substitute(str, ';\n', '\n{\n\t\n}\n', "gm")
	execute "normal! o" . str
	execute "normal! \<up>\<up>\<Del>\<down>\<down>"
endfunction

function Skeleton_cpp_class()
	execute "StdHead2"
	let name = split(@%, '\.')[0]
	let start = line(".")
	execute "normal! o#include \"" . name . ".hpp\"\<esc>o"
	execute "vsplit " . name . ".hpp"
	silent! execute "/.*(.*).*;"
	let first = line(".")
	if first == 1
		q!
		return
	endif
	execute "normal! yy\<C-W>\<C-W>"
	call Add_cpp_func_by_prototype(name, 1)
	execute "normal! \<C-W>\<C-W>n"
	while line(".") != first
		execute "normal! yy\<C-W>\<C-W>"
		call Add_cpp_func_by_prototype(name, 0)
		execute "normal! \<C-W>\<C-W>n"
	endwhile
	q
	execute "normal! dd17gga"
	execute "startinsert"
endfunction

function Skeleton_cpp()
endfunction
