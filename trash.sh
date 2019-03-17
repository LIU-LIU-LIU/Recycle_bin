#!/bin/bash
Dir=`echo ~`
TarshDir="$Dir/trash/.trash"
FileName=`date +%s`
if [ -z "$2" ]
then
	if [ "$1" == '/' ];then
		echo "此操作风险太高，已禁止！"
	else
		mv $1 $TarshDir/$FileName.$1
		echo "移动至回收站成功($TarshDir/$FileName.$1)"
	fi
else
	if [ "$2" == '/' ];then
                echo "此操作风险太高，已禁止！"
	else
		mv $2 $TarshDir/$FileName.$2
		echo "移动至回收站成功($TarshDir/$FileName.$2)"
        fi
fi
