#!/bin/bash
#一个简易回收站
#https://github.com/LIU-LIU-LIU/Recycle_bin

TarshDir="`echo ~`/trash/.trash"
FileNamePrefix=`date +%y-%m-%d-%H-%M-%S`

error(){
echo -e "\033[31m 错误!\n移动至回收站不需要任何命令选项。格式:rm [文件]  \033[0m"
exit 1
}

tarsh(){
case $1 in
-*|./)
	error
;;
/)
	echo -e "\033[31m 此操作风险太高,已禁止! \033[0m"
	exit 1
;;
*)
	mkdir -p "$TarshDir"/"$FileNamePrefix"
	/usr/bin/mv -i "$@" ""$TarshDir"/"$FileNamePrefix"/"
	if [ "$?" == "0" ] ; then
		echo "已将"$@"移动至回收站("$TarshDir"/"$FileNamePrefix"/)"
	else
		echo -e "\033[31m 移动至回收站失败。\033[0m"
		/bin/rm -rf "$TarshDir"/"$FileNamePrefix"
	fi 
;;
esac
}

if [ -z "$1" ];then
        error
else
        tarsh $*
fi
