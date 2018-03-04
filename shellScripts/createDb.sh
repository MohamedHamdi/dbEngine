#!/usr/bin/bash


if [ $# -eq 1 ] 
then 	
	./checkDbExist.sh $1
	r=$?
	if [ $r -eq 1 ] 
	then 
		echo "Db Exist please drop it first"
        elif [ $r -eq 0 ]
	then
		mkdir /home/hamdi/Desktop/HamdiDb/DataBases/$1
	fi
fi
