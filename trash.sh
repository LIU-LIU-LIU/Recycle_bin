#!/bin/bash

TarshDir="~/trash/.trash"
FileName=`date +%s`
mv $* $TarshDir/$FileName.$*
