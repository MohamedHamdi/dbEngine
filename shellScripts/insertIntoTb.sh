#!/usr/bin/bash

if [ $# -eq 2 ] 
then 	
	./checkTbExist.sh $1 $2
	r=$?
	if [ $r -eq 1 ] 
	then 
		rowsCount=$(cat /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md | wc -l)
		columnsName=$(awk 'BEGIN{FS=","}{if(NR>1)print $1;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md)
		columnsType=$(awk 'BEGIN{FS=","}{if(NR>1)print $2;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md)
		columnsPk=$(awk 'BEGIN{FS=","}{if(NR>1)print $3;}' /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2.md)

                num=0
		for Pks in $columnsPk
		do
			if [ $Pks -eq 1 ] 
			then
				break
			fi
		((num=$num+1))	
		done
		
		num2=0
		for columnName in $columnsName
		do
			if [ $num -eq $num2 ] 
			then
				primaryKey=$columnName
				echo "$columnName : is your primary key"
			fi
		((num2=$num2+1))	
		done

		
		while true
		do
			i=0
			for columnName in $columnsName
			do 
				echo "Enter value of $columnName"
				read valueOfColumnName[$i]
				#while true
				#do
				#if [ "$columnName" == "$primaryKey" ]
				#then
				#	if [ "$valueOfColumnName[$i]" == "$(awk)" ]
				#	then
				#		echo "primarykey is used before"
				#		read valueOfColumnName[$i]
				#	else
				#		break
				#	fi
				#else
				#	break
				#fi
				#done
				j=0
				for columnType in $columnsType
				do	
					if [ $j -eq $i ]
					then
						if [ "$columnType" == "int" ] 
						then
							if [[ ${valueOfColumnName[$i]} =~ ^-?[0-9]+$ ]]
							then
								echo "valid Value"
							else	
								while true
								do	
									echo "you entered wrong value plz enter integer value"
									read integerValue
									if [[ $integerValue =~ ^-?[0-9]+$ ]]
									then 	
										valueOfColumnName[$i]=$integerValue
										break
									fi
								done
							fi
						fi
						if [ "$columnType" == "string" ] 
						then
							if [[ ${valueOfColumnName[$i]} =~ ^-?[a-zA-Z]+$ ]]
							then
								echo "valid Value"
							else
								while true
								do
									echo "you entered wrong value plz enter String value"
									read stringValue
									if [[ $stringValue =~ ^-?[a-zA-Z]+$ ]]
									then 
										valueOfColumnName[$i]=$stringValue
										break
									fi
								done
							fi
						fi
					fi
				((j=$j+1))
				done	
			((i=$i+1))
			done
			sed -i "$ a ${valueOfColumnName[*]}" /home/hamdi/Desktop/HamdiDb/DataBases/$1/$2
			echo "if you want to insert another row press any Number except 1"
			read userOptionIfWantCont
			if [ $userOptionIfWantCont -eq 1 ]
			then
				break
			fi
		done
        elif [ $r -eq 0 ]
	then
		echo "Tb not Exist please create it first"
		exit 0
	fi
fi


