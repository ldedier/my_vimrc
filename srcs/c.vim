function Skeleton_h()
	execute "StdHead2"
endfunction

function Skeleton_c()
	execute "StdHead2"
endfunction

function Main_c()
	execute "r " . @b . "/templates/main.c"
endfunction

nmap <C-m> : call Main_c()<CR>
