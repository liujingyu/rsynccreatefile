function! Helloworld()
    if !exists('g:synchronousDir')
        echo "Error: 没配置同步路径"
        finish
    endif

    exec "w"
    let rsync = '!rsync '.expand('%').' '.g:synchronousDir
    exec rsync

endfunction

command! -nargs=0 Helloworld call Helloworld()
