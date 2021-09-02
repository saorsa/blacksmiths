#!/bin/bash

if [ ! -f ~/.my.cnf ]; 
then
    echo "Credentials file .my.cnf not found in ${HOME}"
	exit 1
elif [ ! -f ~/.pgpass ];
then
	echo "Credentials file .pgpass not found in ${HOME}"
	exit 1
fi


backup_name=$(date +"%Y-%m-%d-%H-%M")".tar.gz"

createBackUp ()
{
	tar  -czf $backup_name ./$backup_name
	mv $backup_name ${BACKUP_FOLDER}${backup_name}
}

while getopts ":pm" option
do
	case "${option}"
	in

 		 p)
		  	. ./pgsql.backup.properties.sh
			backup_name="postgresql_"$backup_name
			pg_dumpall -U postgre_admin -h automata -w -f ${backup_name}
			createBackUp
		 ;;
 		 m)
		  	. ./mysql.backup.properties.sh
			backup_name="mysql_"$backup_name
			mysqldump -u mysql_admin -h automata -A -r ${backup_name} 
			createBackUp
		;;
 		 *)echo "not a valid option";;
	esac
done