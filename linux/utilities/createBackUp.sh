#!/bin/bash

usage=$'
'$0' [-u username] [-h host] [-b back_up_folder] [-n name_of_database_to_be_backed_up] [-d mysql/postgresql]
Creates a database back up for MySQL or PostgreSQL:
    -u  database user - mandatory option
    -h  host - mandatory option
    -b  folder to store the craeted back up. If not sepcified will use default folder.
    -n  the name of the database that will be backed up - mandatory option
    -d  mysql/postgresql - mandatory option
	'


if [ ! -f ~/.my.cnf ]; 
then
    echo "Credentials file .my.cnf not found at ${HOME}"
	exit 1
elif [ ! -f ~/.pgpass ];
then
	echo "Credentials file .pgpass not found at ${HOME}"
	exit 1
fi

backup_name=$(date +"%Y-%m-%d-%H-%M")
dbUserEntered=false
hostEntered=false
backUpFolderEntered=false
dbNameEntered=false
databaseEntered=false

compress_backup ()
{
	tar  -czf $backup_name".tar.gz" ./$backup_name
	mv $backup_name".tar.gz" ${backUpFolder}${backup_name}".tar.gz"
	rm $backup_name
}

while getopts ":u:h:b:n:d:" option
do
	case "${option}"
	in
		 u)
		 	#database user
		 	dbUserEntered=true
			dbUser=$OPTARG
		 ;;
		 h)
		 	#host name
			hostEntered=true
			host=$OPTARG
		 ;;
		 b)
		 	#backup folder
			backUpFolderEntered=true
			backUpFolder=$OPTARG
		 ;;
		 n)
		 	#database name to be dumped
			dbNameEntered=true
			dbName=$OPTARG
		 ;;
		 d)
			#database
			databaseEntered=true
			database=$OPTARG
		 ;;
 		 *)
		  	echo "$usage"
			exit 1
		  ;;
	esac
done

if [ "$dbUserEntered" = false ] || 
   [ "$hostEntered" = false ] || 
   [ "$dbNameEntered" = false ] || 
   [ "$databaseEntered" = false ]; 
   then
	echo "$usage"
	exit 1
fi

if [ $database = "mysql" ];then
	if [ "$backUpFolderEntered" = false ]; then
		. ./mysql.backup.properties.sh
		backUpFolder=$BACKUP_FOLDER
	fi

	backup_name="mysql_"$backup_name
	./createMySQLBackUp.sh -u $dbUser -h $host -d $dbName -b $backup_name
	compress_backup

elif [ $database = "postgresql" ];then
	if [ "$backUpFolderEntered" = false ]; then
		. ./pgsql.backup.properties.sh
		backUpFolder=$BACKUP_FOLDER
	fi

	backup_name="postgresql_"$backup_name
	./createPostgreSQLBackUp.sh -u $dbUser -h $host -d $dbName -b $backup_name
	compress_backup
else
	echo "not supported database"
fi
