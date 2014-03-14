" File: rsyncremotefile.vim
" Author: liujingyu
" Description: 编辑后，一键保存并同步服务器项目文件
" Last Modified: 三月 14, 2014
"
function! W2()
    if !exists('g:rdir')
        echo "Error: not remote dir"
        finish
    endif
    if !exists('g:ldir')
        echo "Error: not local dir"
        finish
    endif
    let rdir = g:rdir
    let ldir = expand(g:ldir)
    let cdir = expand('%:p')
    if ldir != matchstr(cdir, ldir, 0)
        echo "Error: not rsync dir"
        finish
    endif 

    exec "w"

    let rdirfile = substitute(cdir, ldir, rdir, "g")
    let rsync = '!rsync '.cdir.' '.rdirfile
    exec rsync

endfunction

command! -nargs=0 W2 call W2()
