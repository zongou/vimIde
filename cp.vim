"------ general key bindings ------"
" select all
nnoremap <C-a> gg0vG$
inoremap <C-a> <ESC>gg0vG$
" Ctrl + s to save
inoremap <C-s> <ESC>:w<CR>a
" Copy to system clipboard
nnoremap<silent> <C-p> :call CopyToSystem()<CR>
function CopyToSystem()
    let bExistTermuxApi=!system('dpkg -s termux-api >/dev/null 2>&1; echo $?')
    if bExistTermuxApi
        let tmpfile = system('mktemp')
        call writefile(getreg('0',1,1), tmpfile, 'b')
        call system('cat "'. tmpfile . '" |termux-clipboard-set')
        call system('termux-toast "copied to clipboard."')
        call system('rm "' . tmpfile . '"' )
    else
        echom "termux-api not installed."
    endif
endfunc
