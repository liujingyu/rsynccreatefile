function! RsyncProjects()
    if !has('python')
        echo "Error: Required vim compiled with +python"
        finish
    endif

    if !exists("g:rdir")
        echo "undefine global rdir"
    endif

    if !exists("g:ldir")
        echo "undefine local ldir"
    endif

python << EOF
import vim

vim.command("exec 'w'")

#初始化
aldir = []
rpath = ''

#获取全局变量
rdir = vim.eval("g:rdir")
ldir = vim.eval("g:ldir")

#绝对本地路径
for v in ldir:
    apath = vim.eval('expand("%s")' % v)
    aldir.append(apath)

#获取当前操作路径
cpath = vim.eval("expand('%:p')")

length = 0
maxcrdir = ''

#本地绝对路径
for k, adir in enumerate(aldir):
    if cpath.startswith(adir):

        if len(adir) > length:
            length = len(adir)
            maxcrdir = rdir[k]+cpath[length:]

maxcrdir = '/'.join(filter(lambda x : x != '', maxcrdir.split('/')))
cmd = " ".join(['!rsync', cpath, maxcrdir])
vim.command('exec "%s"' % cmd)

EOF
" Here the python code is closed. We can continue writing VimL or python again.
endfunction

command! -nargs=0 W2 call RsyncProjects()
