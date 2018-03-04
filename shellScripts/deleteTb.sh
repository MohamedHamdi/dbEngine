#!/usr/bin/bash


if [ $# -eq 2 ] 
then 	
	./checkTbExist.sh $1 $2
	r=$?
	if [ $r -eq 1 ] 
	then 
		rm /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
		rm /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md
		echo "Tb $2 deleted"
        elif [ $r -eq 0 ]
	then
		echo "Tb $1 not found"
	fi
	
fi
