#!/usr/bin/bash


if [ $# -eq 1 ] 
then 	
	count=0
	for dbExistNames in $(find ~/Desktop/HamdiDb/DataBases -mindepth 1 -maxdepth 1 -type d) ; do
    		if [ "/home/hamdi/Desktop/HamdiDb/DataBases/$1" != "$dbExistNames" ] 
    		then
 			((count++))
    		fi
   	done
	if [ $count -eq $(find ~/Desktop/HamdiDb/DataBases -mindepth 1 -maxdepth 1 -type d | wc -l) ]
	then
		exit 0
	else
		exit 1
	fi
fi
