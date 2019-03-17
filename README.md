# Recycle_bin
## 此脚本是为了在Linux的环境下，模拟一个回收站。防止误操作出现问题。<br>  
原理非常简单，使用alisa为/bin/rm创建一个别名。文中\~代表当前用户，输入echo "\~"或者whoami查看<br>  
当用户使用rm删除文件时，调用本脚本为用户将删除的文件移动到回收站。<br>  
回收站程序在\~/trash/trash.sh 回收站目录在:\~/trash/.trash<br>  
