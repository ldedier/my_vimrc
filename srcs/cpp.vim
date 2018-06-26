function Get_hpp_header()
	echo "yolocoucou"
endfunction

function Skeleton_hpp()
	let list = split(expand('%:t'), '\.')
	put = list
	"	+ expand('%:p')
endfunction

function Skeleton_cpp()
endfunction

