#!/bin/bash
Dir=`echo ~`
install(){
mkdir $Dir/trash/.trash
cp trash.sh $Dir/trash/
chmod +x $Dir/trash/trash.sh
grep "trash" "$Dir/.bashrc"
if [ "$?" == "0" ];then
	echo "别名已存在，跳过此配置。"
else
	echo "alias rm='$Dir/trash/trash.sh'" >> $Dir/.bashrc
fi
sleep 1s
source $Dir/.bashrc
while true
do

	read -p "是否添加定时清除回收站任务（y/n）" select
	case $select in
	y|yes|Y)
	        echo -e "\033[47;34m 本功能调用crontab实现定时计划  \033[0m"
		echo -e "\033[47;34m  使用时请参考crontab手册  \033[0m"
		echo -e "\033[47;34m  请在以下直接输入内容，例如：（01 00 * * * rm -rf $Dir/trash/.trash/*）在每天的00点01分清空回收站的文件  \033[0m"
		read -p  "回车确认，如果输错或者不想添加请(ctrl+c)终止" task
		echo  "$task" >> /var/spool/cron/root
		source ~/.bashrc
		break
	;;
	n|no|N)
	        echo -e "\033[47;34m  好  \033[0m"
		break
	;;
	*)
		echo -e "\033[47;34m  请输入正确的选择(y/n)  \033[0m"
	esac
done
if [ -f "$Dir/trash/trash.sh" ]
then
	echo -e "\033[47;34m 已经完成安装，回收站程序在$Dir/trash/trash.sh 回收站目录在:$Dir/trash/.trash \033[0m"
	echo -e "\033[47;34m  回车后完成安装  \033[0m"
	read aha
else
	echo -e "\033[47;34m 安装失败！请检查下载文件完整性和本脚本是否有执行权限 \033[0m"
	echo -e "\033[47;34m 尝试重新拉取文件？（git clone https://github.com/LIU-LIU-LIU/Recycle_bin.git） \033[0m"
	exit 1
fi
}
	
if [ -f "$Dir/trash/trash.sh" ]
then
	while true
	do
		echo -e "\033[47;34m trash.sh已经在您系统上安装了。 \033[0m"
		read -p "是否要替换重新安装?(y/n)" select
		case $select in
	        y|yes|Y)
			echo -e "\033[47;34m 好 \033[0m"
			install
			break
	        ;;
	        n|no|N)
		        echo -e "\033[47;34m  好  \033[0m"
			exit 1
	        ;;
	        *)
			echo -e "\033[47;34m  请输入正确的选择(y/n)  \033[0m"
		esac
	done
else
	echo -e "\033[47;34m 正在安装回收站  \033[0m"
	mkdir ~/trash
	install
fi
