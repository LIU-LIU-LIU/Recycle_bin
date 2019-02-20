#!/bin/bash
Dir=`echo ~`
TarshDir="$Dir/trash/.trash"
FileName=`date +%s`
if [ -z "$2" ]
then
	mv $1 $TarshDir/$FileName.$1
else
	mv $2 $TarshDir/$FileName.$2
fi
