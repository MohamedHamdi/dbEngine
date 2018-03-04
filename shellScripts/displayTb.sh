#!/usr/bin/bash

rowsCount=$(cat /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2 | wc -l)
columnsName=$(awk 'BEGIN{FS=","}{if(NR>1)print $1;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md)
columnsType=$(awk 'BEGIN{FS=","}{if(NR>1)print $2;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md)
columnsPk=$(awk 'BEGIN{FS=","}{if(NR>1)print $3;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md)


if [ $# -eq 2 ] 
then 	
	./checkTbExist.sh $1 $2
	r=$?
	if [ $r -eq 1 ]
	then 
		echo $columnsName
		awk 'BEGIN{FS=" "}{if(NR>1)print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
	fi
fi

if [ $# -eq 4 ] 
then 	
	./checkTbExist.sh $1 $2
	r=$?
	if [ $r -eq 1 ]
	then 
		if [ $3 -gt 0 -a $4 -le $rowsCount ]
		then
			echo $columnsName
			awk 'BEGIN{FS=" "}{if(NR>"'$3'" && NR<="'$4'")print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
		fi	
	fi
fi


if [ $# -eq 3 ] 
then 	
	./checkTbExist.sh $1 $2
	r=$?
	if [ $r -eq 1 ]
	then 
		if [[ $3 =~ ^-?[0-9]+$ || $3 =~ ^-?[a-zA-Z]+$ ]]
		then
			echo $columnsName
			sed -n "/$3/p" /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
		fi	
	fi
fi



if [ $# -eq 5 ] 
then 	
	./checkTbExist.sh $1 $2
	r=$?
	if [ $r -eq 1 ]
	then 
		colName=$3
		operation=$4
		colValue=$5
		i=0
		for item in $columnsName
		do
			if [ "$item" == "$colName" ]
			then
				break
			fi
			((i=$i+1))
		done
	((i=$i+1))
	colType=$(echo $columnsType | awk '{print $'"$i"';}')
	
		if [[ $colValue =~ ^-?[0-9]+$ ]]
		then
			if [ "$colType" == "int" ]
			then
				if [ "$operation" == "=" ] 
				then
					awk  ' { if ('$colValue'==$'$i') print $0 }' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
				fi
				if [ "$operation" == ">" ] 
				then
					awk  ' { if ('$colValue'>$'$i') print $0 }' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
				fi
				if [ "$operation" == "<" ] 
				then
					awk  ' { if ('$colValue'<$'$i') print $0 }' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
				fi
				if [ "$operation" == ">=" ] 
				then
					awk  ' { if ('$colValue'>=$'$i') print $0 }' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
				fi
				if [ "$operation" == "<=" ] 
				then
					awk  ' { if ('$colValue'<=$'$i') print $0 }' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
				fi
				if [ "$operation" == "!=" ] 
				then
					awk  ' { if ('$colValue'!=$'$i') print $0 }' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
				fi
			else
				echo "wrong type for col type string"
			fi
		fi

		if [[ $colValue =~ ^-?[a-zA-Z]+$ ]]
		then
			if [ "$colType" == "string" ]
			then
				if [ "$operation" == "=" ] 
				then
					awk  ' { if ("'$colValue'"==$"'$i'") print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
				fi
				if [ "$operation" == "!=" ] 
				then
					awk  ' { if ("'$colValue'"!=$"'$i'") print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
				fi
			else
				echo "wrong value for col type int"
			fi
			
		fi

			
	fi
fi
