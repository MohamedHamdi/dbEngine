#!/usr/bin/bash


if [ $# -eq 1 ] 
then 	
	./checkDbExist.sh $1
	r=$?
	if [ $r -eq 1 ] 
	then 
		rm -r /home/hamdi/Desktop/HamdiDb/DataBases/$1
		echo "Db $1 deleted"
        elif [ $r -eq 0 ]
	then
		echo "Db $1 not found"
	fi
	
fi
