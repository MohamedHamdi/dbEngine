#!/usr/bin/bash


if [ $# -eq 2 ] 
then 	
	count=0
	for tbExistNames in $(find ~/Desktop/HamdiDb/DataBases/$1 -mindepth 1 -maxdepth 1 -type f) ; do
    		if [ "/home/hamdi/Desktop/HamdiDb/DataBases/$1/$2" != "$tbExistNames" ]
    		then
 			((count++))
    		fi
   	done
	if [ $count -eq $(find ~/Desktop/HamdiDb/DataBases/$1 -mindepth 1 -maxdepth 1 -type f | wc -l) ]
	then
		exit 0
	else
		exit 1
	fi
fi
