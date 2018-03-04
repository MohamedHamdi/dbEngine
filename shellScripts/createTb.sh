#!/usr/bin/bash


if [ $# -eq 2 ] 
then 	
	./checkTbExist.sh $1 $2
	r=$?
	if [ $r -eq 1 ] 
	then 
		echo "Tb Exist please drop it first"
		exit 0
        elif [ $r -eq 0 ]
	then
		touch /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
		echo "~~Data of table $2 in dataBase $1~~" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
		touch /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md
		echo "~~metaData of table $2 in dataBase $1~~" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md
	fi
fi


echo "Enter number of columns"
read columnsNumber
while (($columnsNumber>0))
do 
	echo "Enter Column name"
	read columnName
	echo "Enter COlumn type"
	read columnType
	echo "Enter 1 if col is primaryKey and 0 if it's not"
	read primaryKey
	sed -i "$ a $columnName,$columnType,$primaryKey" /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md
	((columnsNumber=$columnsNumber-1))
done



