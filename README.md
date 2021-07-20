# Recycle_bin
> https://github.com/LIU-LIU-LIU/Recycle_bin
## 此脚本是为了在Linux的环境下，模拟一个回收站。防止误操作出现问题。   
原理非常简单，使用alisa为/bin/rm创建一个别名。
使用方法:
```shell
#git clone https://github.com/LIU-LIU-LIU/Recycle_bin.git
#cd Recycle_bin
#echo "alias rm=`pwd`/trash.sh" >> ~/.bashrc
#source ~/.bashrc
```
> 脚本路径请自己更改成下载路径，回收站目录在:~/trash/.trash   
当用户使用rm命令删除文件时，调用本脚本为用户将删除的文件移动到回收站。

--- 
演示:   
```shell
#ls
dahuw  fdauijdiaejhf  jeh  ns  scn  shfisn  uifhsuiueh  vk
#rm *
已将dahuw fdauijdiaejhf jeh ns scn shfisn uifhsuiueh vk移动至回收站(/root/trash/.trash/19-12-04-17-13-38/)
#rm .././test/*
已将.././test/dahuw .././test/fdauijdiaejhf .././test/jeh .././test/ns .././test/scn .././test/shfisn .././test/uifhsuiueh .././test/vk移动至回收站(/root/trash/.trash/19-12-04-17-14-43/)
```
  
```shell
#rm /
 此操作风险太高,已禁止! 
#rm v
mv: 无法获取"v" 的文件状态(stat): 没有那个文件或目录
 移动至回收站失败。
#rm
错误!可能原因:
提供了空的参数;
移动至回收站不需要任何命令选项。  
```
