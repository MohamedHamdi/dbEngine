#!/usr/bin/bash

rowsCount=$(cat /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2 | wc -l)
columnsName=$(awk 'BEGIN{FS=","}{if(NR>1)print $1;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md)
columnsType=$(awk 'BEGIN{FS=","}{if(NR>1)print $2;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md)
columnsPk=$(awk 'BEGIN{FS=","}{if(NR>1)print $3;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md)


if [ $# -eq 7 ] 
then 	
	./checkTbExist.sh $1 $2
	r=$?
	if [ $r -eq 1 ]
	then 
		colToChange=$3
		colToChangeNewValue=$4
		colName=$5
		operation=$6
		colValue=$7

		k=0
		for item in $columnsName
		do
			if [ "$item" == "$colToChange" ]
			then
				break
			fi
			((k=$k+1))
		done
		((k=$k+1))
		colToChangeType=$(echo $columnsType | awk '{print $'"$k"';}')
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
					if [[ $colToChangeNewValue =~ ^-?[0-9]+$ ]]
					then
						if [ "$colToChangeType" == "int" ]
						then
							echo "$(awk ' { if ("'$colValue'"==$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
					if [[ $colToChangeNewValue =~ ^-?[a-zA-Z]+$ ]]
					then
						if [ "$colToChangeType" == "string" ]
						then
							echo "$(awk ' { if ("'$colValue'"==$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
				fi
				if [ "$operation" == ">" ] 
				then
					if [[ $colToChangeNewValue =~ ^-?[0-9]+$ ]]
					then
						if [ "$colToChangeType" == "int" ]
						then
							echo "$(awk ' { if ("'$colValue'">$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
					if [[ $colToChangeNewValue =~ ^-?[a-zA-Z]+$ ]]
					then
						if [ "$colToChangeType" == "string" ]
						then
							echo "$(awk ' { if ("'$colValue'">$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
				fi
				if [ "$operation" == "<" ] 
				then
					if [[ $colToChangeNewValue =~ ^-?[0-9]+$ ]]
					then
						if [ "$colToChangeType" == "int" ]
						then
							echo "$(awk ' { if ("'$colValue'"<$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
					if [[ $colToChangeNewValue =~ ^-?[a-zA-Z]+$ ]]
					then
						if [ "$colToChangeType" == "string" ]
						then
							echo "$(awk ' { if ("'$colValue'"<$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
				fi
				if [ "$operation" == ">=" ] 
				then
					if [[ $colToChangeNewValue =~ ^-?[0-9]+$ ]]
					then
						if [ "$colToChangeType" == "int" ]
						then
							echo "$(awk ' { if ("'$colValue'">=$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
					if [[ $colToChangeNewValue =~ ^-?[a-zA-Z]+$ ]]
					then
						if [ "$colToChangeType" == "string" ]
						then
							echo "$(awk ' { if ("'$colValue'">=$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
				fi
				if [ "$operation" == "<=" ] 
				then
					if [[ $colToChangeNewValue =~ ^-?[0-9]+$ ]]
					then
						if [ "$colToChangeType" == "int" ]
						then
							echo "$(awk ' { if ("'$colValue'"<=$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
					if [[ $colToChangeNewValue =~ ^-?[a-zA-Z]+$ ]]
					then
						if [ "$colToChangeType" == "string" ]
						then
							echo "$(awk ' { if ("'$colValue'"<=$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
				fi
				if [ "$operation" == "!=" ] 
				then
					if [[ $colToChangeNewValue =~ ^-?[0-9]+$ ]]
					then
						if [ "$colToChangeType" == "int" ]
						then
							echo "$(awk ' { if ("'$colValue'"!=$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
					if [[ $colToChangeNewValue =~ ^-?[a-zA-Z]+$ ]]
					then
						if [ "$colToChangeType" == "string" ]
						then
							echo "$(awk ' { if ("'$colValue'"!=$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
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
					if [[ $colToChangeNewValue =~ ^-?[a-zA-Z]+$ ]]
					then
						if [ "$colToChangeType" == "string" ]
						then
							echo "$(awk ' { if ("'$colValue'"==$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
					if [[ $colToChangeNewValue =~ ^-?[0-9]+$ ]]
					then
						if [ "$colToChangeType" == "int" ]
						then
							echo "$(awk ' { if ("'$colValue'"==$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
				fi
				if [ "$operation" == "!=" ] 
				then
					if [[ $colToChangeNewValue =~ ^-?[a-zA-Z]+$ ]]
					then
						if [ "$colToChangeType" == "string" ]
						then
							echo "$(awk ' { if ("'$colValue'"!=$"'$i'") $"'$k'"="'$colToChangeNewValue'";print $0;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
					if [[ $colToChangeNewValue =~ ^-?[0-9]+$ ]]
					then
						if [ "$colToChangeType" == "int" ]
						then
						      echo  "$(awk ' { if ("'$colValue'"!=$"'$i'")  $"'$k'"="'$colToChangeNewValue'";print $0}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2)" > /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
						fi
					fi
				fi
			else
				echo "wrong value for col type int"
			fi
			
		fi

			
	fi
fi
