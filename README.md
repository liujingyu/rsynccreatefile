本地编辑同步到服务器的运行环境
" add author name in snips_author
let g:snips_author = "liujingyu"
=============================

通过设置同步路径

并且含有rsync命令或者scp命令等可直接替换文件中的命令,即可

好处就是每次修改完提交省去一个命令，要是换了文件还得重新写命令,也省了。

在.vimrc中配置同步的路径

"设置远程路径
let g:rdir = "abc@example.com:/abc/"
"设置本地路径
let g:ldir = "~/abc/"


