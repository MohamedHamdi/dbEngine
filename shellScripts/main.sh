#!/usr/bin/bash

myDatabasePath=""

select choice in 'press 1 to list databases' 'press 2 to choose a database' 'press 3 create a new database' 'press 4 to delete database'
do
	i=0
	for folder in /home/hamdi/Desktop/HamdiDb/DataBases/*
	do
		databases[$i]=$folder
		((i=$i+1))
	done

	case $choice in 
	'press 1 to list databases') 
		ls /home/hamdi/Desktop/HamdiDb/DataBases/ 
	;;
	'press 2 to choose a database')
		j=0
		for database in ${databases[@]}
		do
			echo "if you want to choose $database press $j"
			((j=$j+1))
		done

		read userInput
		if [ "$userInput" -le "$j" ]
		then
			myDatabasePath="${databases[$userInput]}"
			echo "You Are Using : $myDatabasePath"
			select choice2 in 'insert' 'update' 'delete' 'select' 'display all'
			do
				case $choice2 in 
				'insert') echo "insert" ;;
				'update') echo "update" ;;
				'delete') echo "delete" ;;
				'select') echo "select" ;;
				'display all') echo "display all" ;;
				*) break ;;
				esac
	echo "	#####################################################	
		press 1 to insert 
		press 2 to update 
		press 3 to delete 
		press 4 to select 
		press 5 to display all
		#####################################################				"
			done
		fi
	;;
	'press 3 create a new database')
		echo "Enter dataBase name "
		read databaseName
		./createDb.sh $databaseName
	;;
	'press 4 to delete database')
		echo "Enter dataBase name "
		read databaseName
		./deleteDb.sh $databaseName
	;;
	*) 
		break 
	;;
	esac
	echo "	########################################################	
		press 1 to list databases
  		press 2 to choose a database  
		press 3 create a new database  
		press 4 to delete database	
		########################################################				"
done

