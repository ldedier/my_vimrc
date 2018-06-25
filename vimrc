source .vimrc_cpp
syntax on
set number
set ruler
set cc=80

function Lol()
	echo expand('%:t')
endfunction

function Skeleton_hpp()
	let list = split(expand('%:t'), '\.')
	put = list
   "	+ expand('%:p')
endfunction

function Lol1()
	echo expand('%:e')
	if (expand('%:e') == "hpp")
		call Skeleton_hpp()
	endif
endfunction
