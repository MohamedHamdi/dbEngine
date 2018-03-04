#!/usr/bin/bash


if [ $# -eq 3 ] 
then 	
	./checkTbExist.sh $1 $2
	r=$?
	if [ $r -eq 1 ] 
	then
		rowsCount=$(cat /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2 | wc -l)
		if [ $rowsCount -gt 1 ] 
		then
		 	if [[ $3 =~ ^-?[0-9]+$ ]]
			then
				((numberLine=$3+2))
				sed -i "${numberLine}d" /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
			fi	
			if [[ $3 =~ ^-?[a-zA-Z]+$ ]]
			then
				sed -i "/$3/d" /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
			fi
		fi
	fi
fi


if [ $# -eq 4 ] 
then 	
	./checkTbExist.sh $1 $2
	r=$?
	if [ $r -eq 1 ] 
	then
		rowsCount=$(cat /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2 | wc -l)
		if [ $rowsCount -gt 1 ] 
		then
		 	if [[ $3 =~ ^-?[0-9]+$ && $4 =~ ^-?[0-9]+$ ]]
			then
				((numberLine=$3+2))
				sed -i "${numberLine},$4d" /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
			fi
		fi
	fi
fi


if [ $# -eq 2 ] 
then 	
	./checkTbExist.sh $1 $2
	r=$?
	if [ $r -eq 1 ] 
	then
		rowsCount=$(cat /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2 | wc -l)
		if [ $rowsCount -gt 1 ] 
		then
			sed -i "2,${rowsCount}d" /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
		fi
	fi
fi


