#!/bin/bash
#一个简易回收站

TarshDir="`echo ~`/trash/.trash"
FileNamePrefix=`date +%y-%m-%d-%k-%M-%S`

error(){
echo -e "\033[31;47m错误!可能原因:\n提供了空的参数;\n移动至回收站不需要任何命令选项。  \033[0m"
exit 1
}

tarsh(){
case $1 in
-*|./)
	error
;;
/)
	echo -e "\033[31;47m 此操作风险太高,已禁止! \033[0m"
	exit 1
;;
*)
	mkdir "$TarshDir"/"$FileNamePrefix"
	/usr/bin/mv -i "$@" ""$TarshDir"/"$FileNamePrefix"/"
	if [ "$?" == "0" ] ; then
		echo "已将"$@"移动至回收站("$TarshDir"/"$FileNamePrefix"/)"
	else
		echo -e "\033[31;47m 移动至回收站失败。\033[0m"
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
